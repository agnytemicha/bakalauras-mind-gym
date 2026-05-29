<?php

namespace App\Http\Controllers;

use App\Http\Requests\GameReviewCommentRequest;
use App\Models\Game;
use App\Models\GameReview;

class GameReviewCommentController extends Controller
{
    public function store(GameReviewCommentRequest $request, Game $game, GameReview $review)
    {
        abort_if(
            $review->game_id !== $game->id,
            404,
        );

        $validated = $request->validated();

        $review->comments()->create([
            'user_id' => $request->user()->id,
            'body' => $validated['body'],
        ]);

        return back()->with('success', 'Ačiū! Komentaras pateiktas');
    }
}
