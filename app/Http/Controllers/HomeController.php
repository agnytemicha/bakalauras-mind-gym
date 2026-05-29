<?php

namespace App\Http\Controllers;

use App\Http\Resources\HomeArticleResource;
use App\Http\Resources\HomeEventResource;
use App\Http\Resources\HomeGameResource;
use App\Models\Article;
use App\Models\Event;
use App\Models\Game;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;
use Inertia\Inertia;

class HomeController extends Controller
{
    public function index(Request $request)
    {
        $topGame = $this->topGame();
        $latestGames = [];
        $latestArticles = [];

        foreach ($this->latestGames($topGame) as $game) {
            $latestGames[] = (new HomeGameResource($game))->resolve($request);
        }

        foreach ($this->latestArticles() as $article) {
            $latestArticles[] = (new HomeArticleResource($article))->resolve($request);
        }

        return Inertia::render('Home', [
            'stats' => $this->stats(),
            'latestGames' => $latestGames,
            'latestArticles' => $latestArticles,
            'topGame' => $topGame ? (new HomeGameResource($topGame))->resolve($request) : null,
            'upcomingEvents' => $this->homeEvents($this->upcomingEvents($request), $request),
        ]);
    }

    protected function topGame()
    {
        return $this->homeGameQuery(includeDescription: true)
            ->where('featured', true)
            ->orderByDesc('rating')
            ->latest('created_at')
            ->first();
    }

    protected function latestGames(?Game $topGame)
    {
        $query = $this->homeGameQuery();

        if ($topGame) {
            $query->whereKeyNot($topGame->getKey());
        }

        return $query->latest('created_at')
            ->limit(5)
            ->get();
    }

    protected function upcomingEvents(Request $request)
    {
        return Event::query()
            ->select([
                'id',
                'title',
                'slug',
                'description',
                'starts_at',
                'location',
                'seats_total',
            ])
            ->upcoming()
            ->orderBy('starts_at')
            ->limit(5)
            ->get();
    }

    protected function homeEvents(Collection $events, Request $request)
    {
        $registeredEventIds = $this->registeredEventIds($request);
        $cards = [];

        foreach ($events as $index => $event) {
            $cards[] = (new HomeEventResource($event, $index, $registeredEventIds))->resolve($request);
        }

        return $cards;
    }

    protected function registeredEventIds(Request $request)
    {
        $user = $request->user();

        if (! $user) {
            return [];
        }

        return $user->eventRegistrations()->pluck('event_id')->all();
    }

    protected function latestArticles()
    {
        return Article::query()
            ->select([
                'id',
                'title',
                'slug',
                'author',
                'reading_time_minutes',
                'created_at',
            ])
            ->latest('created_at')
            ->limit(3)
            ->get();
    }

    protected function homeGameQuery(bool $includeDescription = false)
    {
        $columns = [
            'id',
            'title',
            'slug',
            'min_players',
            'max_players',
            'age_rating',
            'duration_minutes',
            'difficulty',
        ];

        if ($includeDescription) {
            $columns[] = 'description';
        }

        return Game::query()->select($columns);
    }

    protected function stats()
    {
        return [
            ['label' => 'Žaidimų biblioteka', 'value' => Game::query()->count()],
            ['label' => 'Ateinantys renginiai', 'value' => Event::query()->upcoming()->count()],
            ['label' => 'Bendruomenės nariai', 'value' => User::query()->whereIn('role', ['member'])->count()],
        ];
    }
}
