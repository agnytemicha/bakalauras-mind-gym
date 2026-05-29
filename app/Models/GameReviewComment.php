<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class GameReviewComment extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'game_review_id',
        'user_id',
        'body',
    ];

    public function review()
    {
        return $this->belongsTo(GameReview::class, 'game_review_id');
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
