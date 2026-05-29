<?php

namespace App\Http\Resources;

use App\Support\DateFormatter;
use App\Support\EventDisplayState;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class HomeEventResource extends JsonResource
{
    public function __construct(
        $resource,
        protected int $position = 0,
        protected array $registeredEventIds = [],
    ) {
        parent::__construct($resource);
    }

    public function toArray(Request $request)
    {
        $availableSeats = $this->availableSeats();
        $isRegistered = in_array($this->id, $this->registeredEventIds, true);
        $status = $this->effectiveStatus();
        $startsAt = $this->resource->startsAtDate();
        $buttonVariants = ['danger', 'accent', 'primary'];

        return [
            'title' => $this->title,
            'slug' => $this->slug,
            'description' => $this->description,
            'startsAt' => $startsAt?->toIso8601String(),
            'startsAtLabel' => DateFormatter::eventDateTime($startsAt),
            'startsAtShortLabel' => DateFormatter::shortDate($startsAt),
            'location' => $this->location,
            'seatsTotal' => $this->seats_total,
            'availableSeats' => $availableSeats,
            'seatsLabel' => EventDisplayState::seatsLabel($availableSeats, $this->seats_total),
            'seatsState' => EventDisplayState::seatsState($availableSeats),
            'buttonVariant' => $buttonVariants[$this->position % count($buttonVariants)],
            'status' => $status,
            'isRegistered' => $isRegistered,
            'registrationAction' => EventDisplayState::registrationAction(
                (bool) $request->user(),
                $isRegistered,
                $availableSeats,
                $status,
            ),
        ];
    }
}
