<?php

namespace App\Http\Controllers;

use App\Http\Requests\ArticleCommentRequest;
use App\Models\Article;

class ArticleCommentController extends Controller
{
    public function store(ArticleCommentRequest $request, Article $article)
    {
        $validated = $request->validated();

        $article->comments()->create([
            'user_id' => $request->user()->id,
            'body' => $validated['body'],
        ]);

        return back()->with('success', 'Ačiū! Komentaras paskelbtas.');
    }
}
