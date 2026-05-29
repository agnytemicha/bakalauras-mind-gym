<?php

namespace App\Models\Concerns;

use App\Models\MediaImage;

trait HasMediaImages
{
    public function images()
    {
        return $this->morphMany(MediaImage::class, 'imageable')
            ->orderBy('sort_order')
            ->orderBy('id');
    }
}
