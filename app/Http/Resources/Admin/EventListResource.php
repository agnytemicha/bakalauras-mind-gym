<?php

namespace App\Http\Resources\Admin;

use App\Support\DateFormatter;
use App\Support\MediaImageManager;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class EventListResource extends JsonResource
{
    public function toArray(Request $request)
    {
        $status = $this->effectiveStatus();
        $startsAt = $this->resource->startsAtDate();
        $endsAt = $this->resource->endsAtDate();

        return [
            'id' => $this->id,
            'title' => $this->title,
            'slug' => $this->slug,
            'description' => $this->description,
            'startsAt' => $startsAt?->toIso8601String(),
            'endsAt' => $endsAt?->toIso8601String(),
            'startsAtLabel' => DateFormatter::adminDateTime($startsAt),
            'endsAtLabel' => DateFormatter::adminDateTime($endsAt) ?: 'Nenurodyta',
            'location' => $this->location,
            'status' => $status,
            'statusLabel' => $this->statusLabel($status),
            'statusBadgeClass' => $this->statusBadgeClass($status),
            'publishedAt' => $this->created_at?->toIso8601String(),
            'publishedAtLabel' => DateFormatter::adminDateTime($this->created_at),
            'coverImage' => app(MediaImageManager::class)->coverImageUrl($this->resource),
        ];
    }

    private function statusLabel(string $status)
    {
        return match ($status) {
            'completed' => 'Įvykęs',
            'cancelled' => 'Atšauktas',
            default => 'Vyks',
        };
    }

    private function statusBadgeClass(string $status)
    {
        return match ($status) {
            'completed' => 'bg-[#ADCDEE]',
            'cancelled' => 'bg-[#E38482]',
            default => 'bg-[#F3DBA1]',
        };
    }
}
