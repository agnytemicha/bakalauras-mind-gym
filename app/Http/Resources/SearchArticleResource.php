<?php

namespace App\Http\Resources;

use App\Support\MediaImageManager;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class SearchArticleResource extends JsonResource
{
    public function toArray(Request $request)
    {
        return [
            'id' => $this->id,
            'key' => "article-{$this->id}",
            'title' => $this->title,
            'image' => app(MediaImageManager::class)->coverImageUrl($this->resource),
            'href' => "/blogs/{$this->slug}",
            'slug' => $this->slug,
            'type' => 'article',
        ];
    }
}
