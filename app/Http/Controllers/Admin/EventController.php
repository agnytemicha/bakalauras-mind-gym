<?php

namespace App\Http\Controllers\Admin;

use App\Enums\EventDifficultyLevel;
use App\Enums\EventPriceType;
use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\EventRequest;
use App\Http\Resources\Admin\EventFormResource;
use App\Http\Resources\Admin\EventListResource;
use App\Models\Event;
use App\Support\EventCatalogFilters;
use App\Support\MediaImageManager;
use Illuminate\Http\Request;
use Inertia\Inertia;

class EventController extends Controller
{
    public function __construct(protected MediaImageManager $mediaImages) {}

    public function index(Request $request)
    {
        $filters = EventCatalogFilters::withSearchFromRequest($request);

        $events = Event::query();

        if ($filters['search'] !== '') {
            $events->where(function ($eventQuery) use ($filters) {
                $eventQuery
                    ->where('title', 'like', "%{$filters['search']}%")
                    ->orWhere('description', 'like', "%{$filters['search']}%")
                    ->orWhere('location', 'like', "%{$filters['search']}%");
            });
        }

        $events = EventCatalogFilters::applyAdmin($events, $filters)
            ->latest('starts_at')
            ->latest('id')
            ->get();

        $events = $this->filterAvailableEvents($events, $filters);
        $eventCards = [];

        foreach ($events as $event) {
            $eventCards[] = (new EventListResource($event))->resolve($request);
        }

        return Inertia::render('Admin/Events/Index', [
            'filters' => $filters,
            'filterOptions' => EventCatalogFilters::options(),
            'events' => $eventCards,
        ]);
    }

    public function create()
    {
        return Inertia::render('Admin/Events/Create', [
            'event' => $this->blankEvent(),
            'difficultyOptions' => EventDifficultyLevel::options(),
            'priceOptions' => EventPriceType::options(),
        ]);
    }

    public function edit(Request $request, Event $event)
    {
        return Inertia::render('Admin/Events/Edit', [
            'event' => (new EventFormResource($event))->resolve($request),
            'difficultyOptions' => EventDifficultyLevel::options(),
            'priceOptions' => EventPriceType::options(),
        ]);
    }

    public function store(EventRequest $request)
    {
        $validated = $request->validated();

        $event = Event::query()->create($this->eventAttributes($validated));
        $this->mediaImages->sync(
            $event,
            $validated['images'] ?? [],
            $validated['image_order'] ?? [],
            $validated['removed_image_ids'] ?? [],
            single: true,
        );

        return redirect()
            ->route('admin.events.edit', $event)
            ->with('success', 'Renginys sukurtas.');
    }

    public function update(EventRequest $request, Event $event)
    {
        $validated = $request->validated();

        $event->update($this->eventAttributes($validated));
        $this->mediaImages->sync(
            $event,
            $validated['images'] ?? [],
            $validated['image_order'] ?? [],
            $validated['removed_image_ids'] ?? [],
            single: true,
        );

        return redirect()
            ->route('admin.events.edit', $event)
            ->with('success', 'Renginys atnaujintas.');
    }

    public function destroy(Event $event)
    {
        $this->mediaImages->deleteAll($event);
        $event->delete();

        return redirect()
            ->route('admin.events.index')
            ->with('info', 'Renginys pašalintas.');
    }

    protected function eventAttributes(array $validated)
    {
        return [
            'title' => $validated['title'],
            'slug' => $validated['slug'],
            'description' => $validated['description'],
            'starts_at' => Event::dateTimeForStorage($validated['starts_at']),
            'ends_at' => Event::dateTimeForStorage($validated['ends_at']),
            'location' => $validated['location'],
            'difficulty_level' => $validated['difficulty_level'],
            'price_type' => $validated['price_type'],
            'seats_total' => (int) $validated['seats_total'],
            'status' => $this->eventStatus($validated['status'], $validated['starts_at']),
        ];
    }

    protected function eventStatus(string $submittedStatus, mixed $startsAt)
    {
        if ($submittedStatus === 'cancelled') {
            return 'cancelled';
        }

        return Event::automaticStatusFor($startsAt);
    }

    protected function filterAvailableEvents($events, array $filters)
    {
        if (($filters['show'] ?? EventCatalogFilters::DEFAULT_SHOW) !== 'available') {
            return $events;
        }

        $availableEvents = [];

        foreach ($events as $event) {
            if ($event->availableSeats() > 0) {
                $availableEvents[] = $event;
            }
        }

        return $availableEvents;
    }

    protected function blankEvent()
    {
        return [
            'id' => null,
            'title' => '',
            'slug' => '',
            'description' => '',
            'startsAtDate' => '',
            'startsAtTime' => '',
            'endsAtDate' => '',
            'endsAtTime' => '',
            'location' => '',
            'difficultyLevel' => '',
            'priceType' => '',
            'seatsTotal' => 20,
            'status' => 'upcoming',
            'images' => [],
        ];
    }
}
