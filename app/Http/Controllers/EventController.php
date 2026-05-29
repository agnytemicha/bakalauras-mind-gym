<?php

namespace App\Http\Controllers;

use App\Http\Resources\EventCardResource;
use App\Models\Event;
use App\Support\EventCatalogFilters;
use Illuminate\Http\Request;
use Inertia\Inertia;

class EventController extends Controller
{
    public function index(Request $request)
    {
        $filters = EventCatalogFilters::fromRequest($request);
        $registeredEventIds = $this->registeredEventIds($request);
        $upcomingEvents = $this->eventCards($this->upcomingEvents($filters), $registeredEventIds, $request);
        $pastEvents = $this->eventCards($this->pastEvents(), $registeredEventIds, $request);

        return Inertia::render('Events/Index', [
            'filters' => $filters,
            'filterOptions' => EventCatalogFilters::options(),
            'resultSummary' => 'Rasta '.count($upcomingEvents).' renginių',
            'upcomingEvents' => $upcomingEvents,
            'pastEvents' => $pastEvents,
        ]);
    }

    protected function upcomingEvents(array $filters)
    {
        $events = EventCatalogFilters::applyUpcoming($this->eventCardQuery(), $filters)
            ->orderBy('starts_at')
            ->orderBy('id')
            ->get();

        return $this->filterAvailableEvents($events, $filters);
    }

    protected function pastEvents()
    {
        return $this->eventCardQuery()
            ->past()
            ->latest('starts_at')
            ->take(3)
            ->get();
    }

    protected function eventCardQuery()
    {
        return Event::query();
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

    protected function registeredEventIds(Request $request)
    {
        $user = $request->user();

        if (! $user) {
            return [];
        }

        return $user->eventRegistrations()->pluck('event_id')->all();
    }

    protected function eventCards($events, array $registeredEventIds, Request $request)
    {
        $cards = [];

        foreach ($events as $event) {
            $cards[] = (new EventCardResource($event, $registeredEventIds))->resolve($request);
        }

        return $cards;
    }
}
