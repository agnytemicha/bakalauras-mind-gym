<?php

namespace App\Http\Resources\Admin;

use App\Support\MediaImageManager;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class EventFormResource extends JsonResource
{
    public function toArray(Request $request)
    {
        $startsAt = $this->resource->startsAtDate();
        $endsAt = $this->resource->endsAtDate();

        return [
            'id' => $this->id,
            'title' => $this->title,
            'slug' => $this->slug,
            'description' => $this->description,
            'startsAtDate' => $startsAt?->format('d/m/Y') ?? '',
            'startsAtTime' => $startsAt?->format('H:i') ?? '',
            'endsAtDate' => $endsAt?->format('d/m/Y') ?? '',
            'endsAtTime' => $endsAt?->format('H:i') ?? '',
            'location' => $this->location,
            'difficultyLevel' => $this->difficulty_level,
            'priceType' => $this->price_type,
            'seatsTotal' => $this->seats_total,
            'status' => $this->status === 'cancelled' ? 'cancelled' : 'upcoming',
            'images' => app(MediaImageManager::class)->adminImages($this->resource),
        ];
    }
}
