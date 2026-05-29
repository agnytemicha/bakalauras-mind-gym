<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ArticleComment extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'article_id',
        'user_id',
        'body',
    ];

    public function article()
    {
        return $this->belongsTo(Article::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function replies()
    {
        return $this->hasMany(ArticleCommentReply::class)->latest();
    }

    protected function casts()
    {
        return [
            'deleted_at' => 'datetime',
        ];
    }
}
