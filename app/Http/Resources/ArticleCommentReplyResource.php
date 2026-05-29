<?php

namespace App\Http\Resources;

use App\Support\DateFormatter;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ArticleCommentReplyResource extends JsonResource
{
    public function toArray(Request $request)
    {
        return [
            'id' => $this->id,
            'body' => $this->body,
            'createdAt' => $this->created_at->toIso8601String(),
            'createdAtLabel' => DateFormatter::date($this->created_at),
            'user' => (new UserBadgeResource($this->user))->resolve($request),
        ];
    }
}
