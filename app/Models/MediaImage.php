<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class MediaImage extends Model
{
    protected $fillable = [
        'disk',
        'path',
        'original_name',
        'mime_type',
        'size',
        'sort_order',
    ];

    protected function casts()
    {
        return [
            'size' => 'integer',
            'sort_order' => 'integer',
        ];
    }

    public function imageable()
    {
        return $this->morphTo();
    }

    public function publicUrl()
    {
        return Storage::disk($this->disk)->url($this->path);
    }
}
