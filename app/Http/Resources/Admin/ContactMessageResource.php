<?php

namespace App\Http\Resources\Admin;

use App\Http\Resources\UserBadgeResource;
use App\Support\DateFormatter;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ContactMessageResource extends JsonResource
{
    public function toArray(Request $request)
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'email' => $this->email,
            'message' => $this->message,
            'createdAt' => $this->created_at->toIso8601String(),
            'createdAtLabel' => DateFormatter::adminDateTime($this->created_at),
            'deleteConfirmation' => "Ar tikrai norite pašalinti \"{$this->name}\" žinutę?",
            'user' => $this->user
                ? (new UserBadgeResource($this->user))->resolve($request)
                : null,
        ];
    }
}
