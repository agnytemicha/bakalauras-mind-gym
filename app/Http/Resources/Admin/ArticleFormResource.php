<?php

namespace App\Http\Resources\Admin;

use App\Support\MediaImageManager;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ArticleFormResource extends JsonResource
{
    public static function empty()
    {
        return [
            'id' => null,
            'title' => '',
            'slug' => '',
            'author' => '',
            'tagIds' => [],
            'excerpt' => '',
            'content' => '',
            'readingTimeMinutes' => 5,
            'images' => [],
        ];
    }

    public function toArray(Request $request)
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'slug' => $this->slug,
            'author' => $this->author,
            'tagIds' => $this->tags->pluck('id')->all(),
            'excerpt' => $this->excerpt,
            'content' => $this->content,
            'readingTimeMinutes' => $this->reading_time_minutes,
            'images' => app(MediaImageManager::class)->adminImages($this->resource),
        ];
    }
}
