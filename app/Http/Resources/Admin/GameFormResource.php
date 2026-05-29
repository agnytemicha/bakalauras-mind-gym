<?php

namespace App\Http\Resources\Admin;

use App\Support\MediaImageManager;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

class GameFormResource extends JsonResource
{
    public static function empty()
    {
        return [
            'id' => null,
            'title' => '',
            'description' => '',
            'rules' => '',
            'playTipBlocks' => [],
            'videoBlocks' => [],
            'durationMinutes' => '',
            'ageRating' => '',
            'playersMode' => 'exact',
            'minPlayers' => '',
            'maxPlayers' => '',
            'difficulty' => '3/5',
            'featured' => false,
            'tagIds' => [],
            'images' => [],
            'rulebookFiles' => [],
        ];
    }

    public function toArray(Request $request)
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'description' => $this->description,
            'rules' => (string) $this->rules,
            'playTipBlocks' => $this->resolvedPlayTipBlocks(),
            'videoBlocks' => $this->resolvedVideoBlocks(),
            'durationMinutes' => $this->duration_minutes,
            'ageRating' => $this->age_rating,
            'playersMode' => $this->min_players === $this->max_players ? 'exact' : 'range',
            'minPlayers' => $this->min_players,
            'maxPlayers' => $this->max_players,
            'difficulty' => $this->displayDifficulty(),
            'featured' => (bool) $this->featured,
            'tagIds' => $this->tags->pluck('id')->all(),
            'images' => app(MediaImageManager::class)->adminImages($this->resource),
            'rulebookFiles' => $this->mediaFiles($this->rulebook_files),
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
                'path' => $path,
                'url' => Storage::disk('public')->url($path),
            ];
        }

        return $mediaFiles;
    }
}
