<?php

namespace App\Http\Controllers;

use App\Models\Game;
use Illuminate\Http\Request;

class GameShelfController extends Controller
{
    public function toggleOwned(Request $request, Game $game)
    {
        $ownedGames = $request->user()->ownedGames();
        $alreadyOwned = $ownedGames->whereKey($game->id)->exists();

        if ($alreadyOwned) {
            $ownedGames->detach($game->id);

            return back()->with('info', 'Žaidimas pašalintas iš mano turimų žaidimų.');
        }

        $ownedGames->attach($game->id);

        return back()->with('success', 'Žaidimas pridėtas prie mano turimų žaidimų.');
    }

    public function toggleWishlist(Request $request, Game $game)
    {
        $wishlistGames = $request->user()->wishlistGames();
        $alreadyWishlisted = $wishlistGames->whereKey($game->id)->exists();

        if ($alreadyWishlisted) {
            $wishlistGames->detach($game->id);

            return back()->with('info', 'Žaidimas pašalintas iš norų sąrašo.');
        }

        $wishlistGames->attach($game->id);

        return back()->with('success', 'Žaidimas pridėtas prie norų sąrašo.');
    }
}
