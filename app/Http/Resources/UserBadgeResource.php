<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

class UserBadgeResource extends JsonResource
{
    public function toArray(Request $request)
    {
        $hasPhoto = filled($this->profile_photo_path);

        return [
            'id' => $this->id,
            'name' => $this->name,
            'displayName' => $this->name,
            'username' => $this->username,
            'usernameLabel' => "@{$this->username}",
            'role' => $this->role,
            'photoUrl' => $hasPhoto ? Storage::disk('public')->url($this->profile_photo_path) : null,
            'hasPhoto' => $hasPhoto,
        ];
    }
}
