<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ArticleCommentReply extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'article_comment_id',
        'user_id',
        'body',
    ];

    public function comment()
    {
        return $this->belongsTo(ArticleComment::class, 'article_comment_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    protected function casts()
    {
        return [
            'deleted_at' => 'datetime',
        ];
    }
}
