<?php

namespace App\Http\Resources;

use App\Enums\EventDifficultyLevel;
use App\Enums\EventPriceType;
use App\Support\DateFormatter;
use App\Support\EventDisplayState;
use App\Support\MediaImageManager;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class EventCardResource extends JsonResource
{
    public function __construct($resource, protected array $registeredEventIds = [])
    {
        parent::__construct($resource);
    }

    public function toArray(Request $request)
    {
        $availableSeats = $this->availableSeats();
        $isRegistered = in_array($this->id, $this->registeredEventIds, true);
        $status = $this->effectiveStatus();
        $startsAt = $this->resource->startsAtDate();
        $endsAt = $this->resource->endsAtDate();

        return [
            'id' => $this->id,
            'title' => $this->title,
            'slug' => $this->slug,
            'description' => $this->description,
            'startsAt' => $startsAt?->toIso8601String(),
            'endsAt' => $endsAt?->toIso8601String(),
            'startsAtLabel' => DateFormatter::eventDateTime($startsAt),
            'endsAtLabel' => DateFormatter::eventDateTime($endsAt),
            'location' => $this->location,
            'difficultyLevel' => $this->difficulty_level,
            'difficultyLabel' => EventDifficultyLevel::labelFor($this->difficulty_level),
            'priceType' => $this->price_type,
            'priceLabel' => EventPriceType::labelFor($this->price_type),
            'isPaid' => $this->price_type === EventPriceType::Paid->value,
            'confirmedRegistrationsCount' => $this->confirmedRegistrationsCount(),
            'seatsTotal' => $this->seats_total,
            'availableSeats' => $availableSeats,
            'seatsLabel' => EventDisplayState::seatsLabel($availableSeats, $this->seats_total),
            'seatsState' => EventDisplayState::seatsState($availableSeats),
            'coverImage' => app(MediaImageManager::class)->coverImageUrl($this->resource),
            'status' => $status,
            'publishedAt' => $this->created_at?->toIso8601String(),
            'publishedAtLabel' => DateFormatter::date($this->created_at),
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
