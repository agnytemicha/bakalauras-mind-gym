<?php

namespace App\Http\Resources\Admin;

use App\Http\Resources\GameTagResource;
use App\Support\DateFormatter;
use App\Support\MediaImageManager;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class GameListResource extends JsonResource
{
    public function toArray(Request $request)
    {
        $photoCount = $this->resource->images()->count();
        $ruleBookCount = count($this->rulebook_files ?? []);
        $tags = [];

        foreach ($this->tags as $tag) {
            $tags[] = (new GameTagResource($tag))->resolve($request);
        }

        return [
            'id' => $this->id,
            'title' => $this->title,
            'slug' => $this->slug,
            'coverImage' => app(MediaImageManager::class)->coverImageUrl($this->resource),
            'playersLabel' => $this->resource->playersLabel(),
            'playersCountLabel' => $this->resource->playersCountLabel(),
            'ageRating' => $this->age_rating,
            'ageRatingLabel' => $this->resource->ageRatingLabel(),
            'durationMinutes' => $this->duration_minutes,
            'durationLabel' => $this->resource->durationLabel(),
            'difficulty' => $this->displayDifficulty(),
            'difficultyLabel' => $this->resource->difficultyLabel(),
            'publishedAt' => $this->created_at?->toIso8601String(),
            'publishedAtLabel' => DateFormatter::adminDateTime($this->created_at),
            'tags' => $tags,
            'photoCount' => $photoCount,
            'photoCountLabel' => "{$photoCount} nuotr.",
            'ruleBookCount' => $ruleBookCount,
            'ruleBookCountLabel' => "{$ruleBookCount} taisyklių fail.",
        ];
    }
}
