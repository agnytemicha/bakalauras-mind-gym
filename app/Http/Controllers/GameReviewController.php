<?php

namespace App\Http\Controllers;

use App\Http\Requests\GameReviewRequest;
use App\Models\Game;

class GameReviewController extends Controller
{
    public function store(GameReviewRequest $request, Game $game)
    {
        $validated = $request->validated();

        $game->reviews()->updateOrCreate(
            [
                'user_id' => $request->user()->id,
            ],
            [
                'rating' => $validated['rating'],
                'body' => $validated['body'],
            ],
        );

        $game->refreshRating();

        return back()->with('success', 'Ačiū! Atsiliepimas paskelbtas.');
    }
}
