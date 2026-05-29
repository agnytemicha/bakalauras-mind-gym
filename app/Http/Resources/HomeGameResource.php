<?php

namespace App\Http\Resources;

use App\Support\MediaImageManager;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class HomeGameResource extends JsonResource
{
    public function toArray(Request $request)
    {
        return [
            'title' => $this->title,
            'slug' => $this->slug,
            'description' => $this->whenHas('description'),
            'playersLabel' => $this->resource->playersLabel(),
            'ageRating' => $this->age_rating,
            'ageRatingLabel' => $this->resource->ageRatingLabel(),
            'durationMinutes' => $this->duration_minutes,
            'durationLabel' => $this->resource->durationLabel(),
            'difficulty' => $this->displayDifficulty(),
            'difficultyLabel' => $this->resource->difficultyLabel(),
            'coverImage' => app(MediaImageManager::class)->coverImageUrl($this->resource),
        ];
    }
}
