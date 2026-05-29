<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

class ProfileResource extends JsonResource
{
    public function toArray(Request $request)
    {
        $hasPhoto = filled($this->profile_photo_path);

        return [
            'name' => (string) $this->name,
            'lastName' => $this->last_name ?? '',
            'username' => (string) $this->username,
            'birthDate' => $this->birth_date?->format('Y-m-d') ?? '',
            'email' => (string) $this->email,
            'role' => $this->role,
            'photoUrl' => $hasPhoto ? Storage::disk('public')->url($this->profile_photo_path) : '',
            'hasPhoto' => $hasPhoto,
            'photoButtonLabel' => $hasPhoto ? 'Pakeisti nuotrauką' : 'Įkelti nuotrauką',
            'newsPreferences' => [
                'wants_newsletter' => (bool) $this->wants_newsletter,
                'wants_event_notifications' => (bool) $this->wants_event_notifications,
                'wants_game_notifications' => (bool) $this->wants_game_notifications,
                'wants_learning_notifications' => (bool) $this->wants_learning_notifications,
                'wants_event_reminders' => (bool) $this->wants_event_reminders,
            ],
        ];
    }
}
