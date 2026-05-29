<?php

namespace App\Http\Resources\Admin;

use App\Http\Resources\ArticleTagResource;
use App\Support\DateFormatter;
use App\Support\MediaImageManager;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ArticleListResource extends JsonResource
{
    public function toArray(Request $request)
    {
        $tags = [];

        foreach ($this->tags as $tag) {
            $tags[] = (new ArticleTagResource($tag))->resolve($request);
        }

        return [
            'id' => $this->id,
            'title' => $this->title,
            'slug' => $this->slug,
            'author' => $this->author,
            'excerpt' => $this->excerpt,
            'tags' => $tags,
            'readingTimeMinutes' => $this->reading_time_minutes,
            'readingTimeLabel' => "{$this->reading_time_minutes} min skaitymo",
            'publishedAt' => $this->created_at->toIso8601String(),
            'publishedAtLabel' => DateFormatter::adminDateTime($this->created_at),
            'coverImage' => app(MediaImageManager::class)->coverImageUrl($this->resource),
        ];
    }
}
