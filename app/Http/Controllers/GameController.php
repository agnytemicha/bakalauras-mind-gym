<?php

namespace App\Http\Controllers;

use App\Http\Resources\GameCardResource;
use App\Http\Resources\GameDetailResource;
use App\Http\Resources\PaginationResource;
use App\Models\Game;
use App\Models\User;
use App\Support\GameCatalogFilters;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;
use Inertia\Inertia;

class GameController extends Controller
{
    public function index(Request $request)
    {
        $filters = GameCatalogFilters::fromRequest($request);
        $shelfIds = $this->userShelfIds($request->user());
        $games = GameCatalogFilters::applySort(
            GameCatalogFilters::apply(Game::query(), $filters),
            $filters['sort'],
        )
            ->paginate(9)
            ->withQueryString();
        $gameCards = [];

        foreach ($games as $game) {
            $gameCards[] = (new GameCardResource(
                $game,
                $shelfIds['favorites'],
                $shelfIds['owned'],
                $shelfIds['wishlist'],
            ))->resolve($request);
        }

        return Inertia::render('Games/Index', [
            'filters' => $filters,
            'filterOptions' => GameCatalogFilters::options(),
            'games' => ['data' => $gameCards],
            'pagination' => (new PaginationResource($games))->resolve($request),
        ]);
    }

    public function show(Request $request, Game $game)
    {
        $shelfIds = $this->userShelfIds($request->user());
        $similarGames = $this->similarGames($game);

        return Inertia::render('Games/Show', [
            'game' => (new GameDetailResource(
                $game,
                $shelfIds['favorites'],
                $shelfIds['owned'],
                $shelfIds['wishlist'],
            ))->resolve($request),
            'similarGames' => $this->gameCards($similarGames, $shelfIds, $request),
            'canReview' => (bool) $request->user(),
        ]);
    }

    protected function similarGames(Game $game)
    {
        $similarGames = $this->similarGamesByTags($game);

        if (count($similarGames) > 0) {
            return $similarGames;
        }

        return $this->fallbackSimilarGames($game);
    }

    protected function similarGamesByTags(Game $game)
    {
        $tagIds = $game->tags->pluck('id');

        if ($tagIds->isEmpty()) {
            return [];
        }

        return Game::query()
            ->whereKeyNot($game->id)
            ->whereHas('tags', function ($query) use ($tagIds) {
                $query->whereIn('game_tags.id', $tagIds);
            })
            ->orderByDesc('rating')
            ->latest('created_at')
            ->latest('id')
            ->take(3)
            ->get();
    }

    protected function fallbackSimilarGames(Game $game)
    {
        return Game::query()
            ->whereKeyNot($game->id)
            ->latest('created_at')
            ->latest('id')
            ->take(3)
            ->get();
    }

    protected function userShelfIds(?User $user)
    {
        if (! $user) {
            return [
                'favorites' => [],
                'owned' => [],
                'wishlist' => [],
            ];
        }

        return [
            'favorites' => $user->favorites()->pluck('games.id')->all(),
            'owned' => $user->ownedGames()->pluck('games.id')->all(),
            'wishlist' => $user->wishlistGames()->pluck('games.id')->all(),
        ];
    }

    protected function gameCards(Collection $games, array $shelfIds, Request $request)
    {
        $cards = [];

        foreach ($games as $game) {
            $cards[] = (new GameCardResource(
                $game,
                $shelfIds['favorites'],
                $shelfIds['owned'],
                $shelfIds['wishlist'],
            ))->resolve($request);
        }

        return $cards;
    }
}
