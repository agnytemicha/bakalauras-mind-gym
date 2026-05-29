<?php

namespace App\Models;

use App\Models\Concerns\HasMediaImages;
use Illuminate\Database\Eloquent\Model;

class Article extends Model
{
    use HasMediaImages;

    protected $fillable = [
        'title',
        'slug',
        'excerpt',
        'content',
        'author',
        'reading_time_minutes',
    ];

    public function comments()
    {
        return $this->hasMany(ArticleComment::class);
    }

    public function tags()
    {
        return $this->belongsToMany(ArticleTag::class, 'article_tag')
            ->withTimestamps()
            ->orderBy('article_tags.name');
    }
}
