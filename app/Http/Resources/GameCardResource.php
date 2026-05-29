<?php

namespace App\Http\Resources;

use App\Support\MediaImageManager;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class GameCardResource extends JsonResource
{
    public function __construct(
        $resource,
        protected array $favoriteIds = [],
        protected array $ownedIds = [],
        protected array $wishlistIds = [],
    ) {
        parent::__construct($resource);
    }

    public function toArray(Request $request)
    {
        $reviewCount = $this->reviewCount();

        return [
            'id' => $this->id,
            'title' => $this->title,
            'slug' => $this->slug,
            'description' => $this->description,
            'playersLabel' => $this->resource->playersLabel(),
            'minPlayers' => $this->min_players,
            'maxPlayers' => $this->max_players,
            'ageRating' => $this->age_rating,
            'ageRatingLabel' => $this->resource->ageRatingLabel(),
            'durationMinutes' => $this->duration_minutes,
            'durationLabel' => $this->resource->durationLabel(),
            'difficulty' => $this->displayDifficulty(),
            'difficultyLabel' => $this->resource->difficultyLabel(),
            'rating' => (float) $this->rating,
            'featured' => (bool) $this->featured,
            'coverImage' => app(MediaImageManager::class)->coverImageUrl($this->resource),
            'tags' => $this->tags->pluck('name')->values()->all(),
            'reviewCount' => $reviewCount,
            'reviewCountLabel' => "{$reviewCount} atsiliepimai",
            'isFavorite' => $this->shelfState($this->favoriteIds),
            'isOwned' => $this->shelfState($this->ownedIds),
            'isWishlisted' => $this->shelfState($this->wishlistIds),
        ];
    }

    protected function reviewCount()
    {
        return $this->resource->reviews()->count();
    }

    protected function shelfState(array $fallbackIds)
    {
        return in_array($this->id, $fallbackIds, true);
    }
}
