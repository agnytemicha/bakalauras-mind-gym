<?php

namespace App\Http\Resources;

use App\Support\MediaImageManager;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class SearchEventResource extends JsonResource
{
    public function toArray(Request $request)
    {
        return [
            'id' => $this->id,
            'key' => "event-{$this->id}",
            'title' => $this->title,
            'image' => app(MediaImageManager::class)->coverImageUrl($this->resource),
            'href' => "/events?event={$this->slug}",
            'slug' => $this->slug,
            'type' => 'event',
        ];
    }
}
