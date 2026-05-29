<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    protected $fillable = [
        'name',
        'last_name',
        'username',
        'birth_date',
        'role',
        'email',
        'password',
        'profile_photo_path',
        'wants_newsletter',
        'wants_event_notifications',
        'wants_game_notifications',
        'wants_learning_notifications',
        'wants_event_reminders',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected function casts()
    {
        return [
            'email_verified_at' => 'datetime',
            'birth_date' => 'date',
            'password' => 'hashed',
            'wants_newsletter' => 'boolean',
            'wants_event_notifications' => 'boolean',
            'wants_game_notifications' => 'boolean',
            'wants_learning_notifications' => 'boolean',
            'wants_event_reminders' => 'boolean',
        ];
    }

    public function favorites()
    {
        return $this->belongsToMany(Game::class, 'favorite_games')->withTimestamps();
    }

    public function ownedGames()
    {
        return $this->belongsToMany(Game::class, 'owned_games')->withTimestamps();
    }

    public function wishlistGames()
    {
        return $this->belongsToMany(Game::class, 'wishlist_games')->withTimestamps();
    }

    public function eventRegistrations()
    {
        return $this->hasMany(EventRegistration::class);
    }

    public function gameReviews()
    {
        return $this->hasMany(GameReview::class);
    }

    public function articleComments()
    {
        return $this->hasMany(ArticleComment::class);
    }

    public function gameReviewComments()
    {
        return $this->hasMany(GameReviewComment::class);
    }
}
