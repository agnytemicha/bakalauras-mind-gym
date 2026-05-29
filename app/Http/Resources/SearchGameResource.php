<?php

namespace App\Http\Resources;

use App\Support\MediaImageManager;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class SearchGameResource extends JsonResource
{
    public function toArray(Request $request)
    {
        return [
            'id' => $this->id,
            'key' => "game-{$this->id}",
            'title' => $this->title,
            'image' => app(MediaImageManager::class)->coverImageUrl($this->resource),
            'href' => "/games/{$this->slug}",
            'slug' => $this->slug,
            'type' => 'game',
        ];
    }
}
