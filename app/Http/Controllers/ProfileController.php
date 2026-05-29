<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileEmailRequest;
use App\Http\Requests\ProfileNewsletterRequest;
use App\Http\Requests\ProfilePasswordRequest;
use App\Http\Requests\ProfilePhotoRequest;
use App\Http\Requests\ProfileUpdateRequest;
use App\Http\Resources\EventCardResource;
use App\Http\Resources\GameCardResource;
use App\Http\Resources\ProfileResource;
use App\Models\User;
use App\Support\GameCatalogFilters;
use Carbon\CarbonImmutable;
use Carbon\CarbonInterface;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Inertia\Inertia;

class ProfileController extends Controller
{
    public function show(Request $request)
    {
        $now = CarbonImmutable::now(config('app.timezone'));
        $user = $request->user();
        $eventRegistrations = $user->eventRegistrations()->get();
        $activeTab = $this->activeProfileTab($request);
        $gameFilters = GameCatalogFilters::fromRequest($request, false);
        $shelfIds = $this->gameShelfIds($user);

        return Inertia::render('Profile', [
            'profile' => (new ProfileResource($user))->resolve($request),
            'gameFilters' => [
                'filters' => $gameFilters,
                'controls' => GameCatalogFilters::profileControls($gameFilters),
            ],
            'gameShelves' => $this->profileGameShelves($user, $shelfIds, $activeTab, $gameFilters, $request),
            'registeredEventSections' => $this->registeredEventSections($eventRegistrations, $request, $now),
        ]);
    }

    public function update(ProfileUpdateRequest $request)
    {
        $user = $request->user();

        $validated = $request->validated();

        $validated['last_name'] = filled($validated['last_name'] ?? null) ? $validated['last_name'] : null;

        $user->update($validated);

        return back()->with('success', 'Profilio informacija atnaujinta.');
    }

    public function updateEmail(ProfileEmailRequest $request)
    {
        $user = $request->user();

        $validated = $request->validated();

        $user->update([
            'email' => $validated['email'],
        ]);

        return back()->with('success', 'El. pašto adresas atnaujintas.');
    }

    public function updatePhoto(ProfilePhotoRequest $request)
    {
        $validated = $request->validated();

        $user = $request->user();
        $previousPhotoPath = $user->profile_photo_path;
        $newPhotoPath = $validated['photo']->store("users/{$user->id}/profile-photo", 'public');

        $user->update([
            'profile_photo_path' => $newPhotoPath,
        ]);

        if ($previousPhotoPath && $previousPhotoPath !== $newPhotoPath && Storage::disk('public')->exists($previousPhotoPath)) {
            Storage::disk('public')->delete($previousPhotoPath);
        }

        return back()->with('success', 'Profilio nuotrauka išsaugota.');
    }

    public function updateNewsletter(ProfileNewsletterRequest $request)
    {
        $validated = $request->validated();

        $request->user()->update($validated);

        return back();
    }

    public function updatePassword(ProfilePasswordRequest $request)
    {
        $validated = $request->validated();

        $request->user()->update([
            'password' => Hash::make($validated['password']),
        ]);

        return back()->with('success', 'Slaptažodis pakeistas.');
    }

    private function gameShelfQuery(BelongsToMany $query)
    {
        return $query->orderByPivot('created_at', 'desc');
    }

    private function gameShelfIds(User $user)
    {
        return [
            'favorites' => $user->favorites()->pluck('games.id')->all(),
            'owned' => $user->ownedGames()->pluck('games.id')->all(),
            'wishlist' => $user->wishlistGames()->pluck('games.id')->all(),
        ];
    }

    private function gameCards(Collection $games, array $shelfIds, Request $request)
    {
        $cards = [];

        foreach ($games as $game) {
            $cards[] = (new GameCardResource(
                $game,
                $shelfIds['favorites'],
                $shelfIds['owned'],
                $shelfIds['wishlist'],
            ))->resolve($request);
        }

        return $cards;
    }

    private function profileGameShelves(
        User $user,
        array $shelfIds,
        string $activeTab,
        array $filters,
        Request $request,
    ) {
        return [
            'owned' => $this->profileGameShelf($user, 'owned', $shelfIds, $activeTab, $filters, $request),
            'wishlist' => $this->profileGameShelf($user, 'wishlist', $shelfIds, $activeTab, $filters, $request),
            'favorites' => $this->profileGameShelf($user, 'favorites', $shelfIds, $activeTab, $filters, $request),
        ];
    }

    private function profileGameShelf(
        User $user,
        string $shelfKey,
        array $shelfIds,
        string $activeTab,
        array $filters,
        Request $request,
    ) {
        $total = $this->gameShelfRelation($user, $shelfKey)->count();
        $query = $this->gameShelfQuery($this->gameShelfRelation($user, $shelfKey));
        $shouldFilter = $activeTab === $shelfKey && GameCatalogFilters::hasActiveFilters($filters);

        if ($shouldFilter) {
            $query = GameCatalogFilters::apply($query, $filters);
        }

        $games = $query->get();

        return [
            'games' => $this->gameCards($games, $shelfIds, $request),
            'total' => $total,
            'filteredTotal' => $games->count(),
            'hasActiveFilters' => $shouldFilter,
        ];
    }

    private function gameShelfRelation(User $user, string $shelfKey)
    {
        return match ($shelfKey) {
            'wishlist' => $user->wishlistGames(),
            'favorites' => $user->favorites(),
            default => $user->ownedGames(),
        };
    }

    private function activeProfileTab(Request $request)
    {
        $tab = trim((string) $request->string('tab'));

        return in_array($tab, ['owned', 'wishlist', 'favorites', 'events', 'faq'], true)
            ? $tab
            : 'owned';
    }

    private function registeredEventSections(Collection $registrations, Request $request, CarbonImmutable $now)
    {
        $sections = [
            'this-week' => ['key' => 'this-week', 'title' => 'Šią savaitę:', 'events' => []],
            'this-month' => ['key' => 'this-month', 'title' => 'Šį mėnesį:', 'events' => []],
            'other-upcoming' => ['key' => 'other-upcoming', 'title' => 'Kiti ateinantys:', 'events' => []],
        ];
        $endOfWeek = $now->endOfWeek(CarbonInterface::SUNDAY);
        $endOfMonth = $now->endOfMonth();
        $sortedRegistrations = [];

        foreach ($registrations as $registration) {
            $event = $registration->event;

            if ($event && $event->effectiveStatus($now) === 'upcoming') {
                $sortedRegistrations[] = $registration;
            }
        }

        usort($sortedRegistrations, function ($first, $second) {
            return $first->event->startsAtDate()->getTimestamp() <=> $second->event->startsAtDate()->getTimestamp();
        });

        foreach ($sortedRegistrations as $registration) {
            $event = $registration->event;
            $startsAt = $event->startsAtDate();
            $eventCard = (new EventCardResource($event, [$event->id]))->resolve($request);

            if ($startsAt->lessThanOrEqualTo($endOfWeek)) {
                $sections['this-week']['events'][] = $eventCard;
            } elseif ($startsAt->lessThanOrEqualTo($endOfMonth)) {
                $sections['this-month']['events'][] = $eventCard;
            } else {
                $sections['other-upcoming']['events'][] = $eventCard;
            }
        }

        foreach ($sections as $key => $section) {
            if ($section['events'] === []) {
                unset($sections[$key]);
            }
        }

        return array_values($sections);
    }
}
