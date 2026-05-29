<?php

namespace App\Http\Resources;

use App\Support\DateFormatter;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ArticleCommentResource extends JsonResource
{
    public function toArray(Request $request)
    {
        return [
            'id' => $this->id,
            'body' => $this->body,
            'createdAt' => $this->created_at->toIso8601String(),
            'createdAtLabel' => DateFormatter::date($this->created_at),
            'user' => (new UserBadgeResource($this->user))->resolve($request),
            'replies' => $this->replies($request),
        ];
    }

    protected function replies(Request $request)
    {
        $replies = [];

        foreach ($this->resource->replies()->oldest('created_at')->get() as $reply) {
            $replies[] = (new ArticleCommentReplyResource($reply))->resolve($request);
        }

        return $replies;
    }
}
