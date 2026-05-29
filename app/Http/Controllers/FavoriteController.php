<?php

namespace App\Http\Controllers;

use App\Models\Game;
use Illuminate\Http\Request;

class FavoriteController extends Controller
{
    public function toggle(Request $request, Game $game)
    {
        $favorites = $request->user()->favorites();

        $alreadyFavorite = $favorites->whereKey($game->id)->exists();

        if ($alreadyFavorite) {
            $favorites->detach($game->id);

            return back()->with('info', 'Žaidimas pašalintas iš mėgstamiausių.');
        }

        $favorites->attach($game->id);

        return back()->with('success', 'Žaidimas pridėtas prie mėgstamiausių.');
    }
}
