<?php

namespace App\Http\Resources;

use App\Support\DateFormatter;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class GameReviewResource extends JsonResource
{
    public function toArray(Request $request)
    {
        return [
            'id' => $this->id,
            'rating' => $this->rating,
            'body' => $this->body,
            'createdAt' => $this->created_at->toIso8601String(),
            'createdAtLabel' => DateFormatter::date($this->created_at),
            'user' => (new UserBadgeResource($this->user))->resolve($request),
            'comments' => $this->comments($request),
        ];
    }

    protected function comments(Request $request)
    {
        $comments = [];

        foreach ($this->resource->comments()->oldest('created_at')->get() as $comment) {
            $comments[] = (new GameReviewCommentResource($comment))->resolve($request);
        }

        return $comments;
    }
}
