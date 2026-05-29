<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;

class ArticleDetailResource extends ArticleCardResource
{
    public function toArray(Request $request)
    {
        $comments = [];

        foreach ($this->resource->comments()->latest('created_at')->get() as $comment) {
            $comments[] = (new ArticleCommentResource($comment))->resolve($request);
        }

        return [
            ...parent::toArray($request),
            'comments' => $comments,
        ];
    }
}
