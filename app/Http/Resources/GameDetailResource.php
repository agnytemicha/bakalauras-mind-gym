<?php

namespace App\Http\Resources;

use App\Models\Game;
use App\Support\DateFormatter;
use App\Support\YouTubeVideoSupport;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class GameDetailResource extends GameCardResource
{
    public function toArray(Request $request)
    {
        $base = parent::toArray($request);
        $images = $this->mediaImages($this->resource);
        $reviews = [];

        foreach ($this->resource->reviews()->latest('created_at')->get() as $review) {
            $reviews[] = (new GameReviewResource($review))->resolve($request);
        }

        return [
            ...$base,
            'images' => $images,
            'galleryImages' => $this->galleryImages($images, $base['coverImage']),
            'rules' => (string) $this->rules,
            'playTipBlocks' => $this->resource->resolvedPlayTipBlocks(),
            'videoBlocks' => $this->videoBlocks($this->resource),
            'ruleBooks' => $this->mediaFiles($this->rulebook_files),
            'publishedAt' => $this->created_at?->toIso8601String(),
            'publishedAtLabel' => DateFormatter::date($this->created_at),
            'reviews' => $reviews,
        ];
    }

    protected function videoBlocks(Game $game)
    {
        $blocks = [];

        foreach ($game->resolvedVideoBlocks() as $index => $block) {
            $blocks[] = [
                'id' => "game-{$game->id}-video-{$index}",
                'title' => $block['title'],
                'author' => $block['author'],
                'youtubeUrl' => $block['youtube_url'],
                'thumbnailUrl' => YouTubeVideoSupport::thumbnailUrl($block['youtube_url']),
            ];
        }

        return $blocks;
    }

    protected function galleryImages(array $images, ?string $coverImage)
    {
        if ($images !== []) {
            return $images;
        }

        if (! $coverImage) {
            return [];
        }

        return [
            [
                'id' => 'cover-fallback',
                'url' => $coverImage,
                'name' => $this->title,
            ],
        ];
    }

    protected function mediaFiles(?array $files)
    {
        $mediaFiles = [];

        foreach ($files ?? [] as $file) {
            $path = (string) ($file['path'] ?? '');

            if ($path === '') {
                continue;
            }

            $mediaFiles[] = [
                'name' => (string) ($file['name'] ?? basename($path)),
                'url' => Storage::disk('public')->url($path),
            ];
        }

        return $mediaFiles;
    }

    protected function mediaImages(Game $game)
    {
        $images = [];

        foreach ($game->images as $image) {
            $images[] = [
                'id' => $image->id,
                'name' => $image->original_name ?: basename($image->path),
                'url' => $image->publicUrl(),
            ];
        }

        return $images;
    }
}
