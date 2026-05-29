<?php

namespace App\Http\Controllers;

use App\Http\Requests\ArticleCommentReplyRequest;
use App\Models\Article;
use App\Models\ArticleComment;

class ArticleCommentReplyController extends Controller
{
    public function store(ArticleCommentReplyRequest $request, Article $article, ArticleComment $comment)
    {
        abort_if(
            $comment->article_id !== $article->id,
            404,
        );

        $validated = $request->validated();

        $comment->replies()->create([
            'user_id' => $request->user()->id,
            'body' => $validated['body'],
        ]);

        return back()->with('success', 'Ačiū! Komentaras paskelbtas.');
    }
}
