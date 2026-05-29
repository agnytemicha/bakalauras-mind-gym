<?php

namespace App\Http\Resources;

use App\Support\DateFormatter;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class HomeArticleResource extends JsonResource
{
    public function toArray(Request $request)
    {
        $commentCount = $this->resource->comments()->count();

        return [
            'title' => $this->title,
            'slug' => $this->slug,
            'author' => $this->author,
            'readingTimeMinutes' => $this->reading_time_minutes,
            'readingTimeLabel' => "{$this->reading_time_minutes} min skaitymo",
            'publishedAt' => $this->created_at->toIso8601String(),
            'publishedAtLabel' => DateFormatter::date($this->created_at),
            'commentCount' => $commentCount,
            'commentCountLabel' => "{$commentCount} kom.",
        ];
    }
}
