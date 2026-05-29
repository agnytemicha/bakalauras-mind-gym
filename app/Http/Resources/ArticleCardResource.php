<?php

namespace App\Http\Resources;

use App\Support\DateFormatter;
use App\Support\MediaImageManager;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ArticleCardResource extends JsonResource
{
    public function toArray(Request $request)
    {
        $commentCount = $this->commentCount();
        $tags = [];

        foreach ($this->tags as $tag) {
            $tags[] = (new ArticleTagResource($tag))->resolve($request);
        }

        return [
            'id' => $this->id,
            'title' => $this->title,
            'slug' => $this->slug,
            'author' => $this->author,
            'tags' => $tags,
            'excerpt' => $this->excerpt,
            'content' => $this->content,
            'readingTimeMinutes' => $this->reading_time_minutes,
            'readingTimeLabel' => $this->readingTimeLabel(),
            'coverImage' => app(MediaImageManager::class)->coverImageUrl($this->resource),
            'publishedAt' => $this->created_at->toIso8601String(),
            'publishedAtLabel' => DateFormatter::date($this->created_at),
            'commentCount' => $commentCount,
            'commentCountLabel' => "{$commentCount} kom.",
        ];
    }

    protected function readingTimeLabel()
    {
        return "{$this->reading_time_minutes} min skaitymo";
    }

    protected function commentCount()
    {
        return $this->resource->comments()->count();
    }
}
