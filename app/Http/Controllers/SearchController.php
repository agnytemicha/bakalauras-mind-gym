<?php

namespace App\Http\Controllers;

use App\Http\Resources\SearchArticleResource;
use App\Http\Resources\SearchEventResource;
use App\Http\Resources\SearchGameResource;
use App\Models\Article;
use App\Models\Event;
use App\Models\Game;
use Illuminate\Http\Request;

class SearchController extends Controller
{
    private const MIN_QUERY_LENGTH = 2;

    private const RESULT_LIMIT = 4;

    public function __invoke(Request $request)
    {
        $query = trim((string) $request->string('query'));

        if (mb_strlen($query) < self::MIN_QUERY_LENGTH) {
            return response()->json($this->emptyResults($query));
        }

        $games = [];
        $articles = [];
        $events = [];

        foreach ($this->matchingGames($query) as $game) {
            $games[] = (new SearchGameResource($game))->resolve($request);
        }

        foreach ($this->matchingArticles($query) as $article) {
            $articles[] = (new SearchArticleResource($article))->resolve($request);
        }

        foreach ($this->matchingEvents($query) as $event) {
            $events[] = (new SearchEventResource($event))->resolve($request);
        }

        return response()->json([
            'query' => $query,
            'games' => $games,
            'articles' => $articles,
            'events' => $events,
            'sections' => $this->sections($games, $articles, $events),
        ]);
    }

    protected function emptyResults(string $query)
    {
        return [
            'query' => $query,
            'games' => [],
            'articles' => [],
            'events' => [],
            'sections' => [],
        ];
    }

    protected function matchingGames(string $query)
    {
        return Game::query()
            ->where('title', 'like', "%{$query}%")
            ->orderByDesc('featured')
            ->latest('created_at')
            ->take(self::RESULT_LIMIT)
            ->get();
    }

    protected function matchingArticles(string $query)
    {
        return Article::query()
            ->where('title', 'like', "%{$query}%")
            ->latest('created_at')
            ->latest('id')
            ->take(self::RESULT_LIMIT)
            ->get();
    }

    protected function matchingEvents(string $query)
    {
        return Event::query()
            ->upcoming()
            ->where('title', 'like', "%{$query}%")
            ->orderBy('starts_at')
            ->take(self::RESULT_LIMIT)
            ->get();
    }

    protected function sections(array $games, array $articles, array $events)
    {
        $sections = [];

        if ($games !== []) {
            $sections[] = [
                'key' => 'games',
                'title' => 'Žaidimai',
                'items' => $games,
            ];
        }

        if ($articles !== []) {
            $sections[] = [
                'key' => 'articles',
                'title' => 'Straipsniai',
                'items' => $articles,
            ];
        }

        if ($events !== []) {
            $sections[] = [
                'key' => 'events',
                'title' => 'Renginiai',
                'items' => $events,
            ];
        }

        return $sections;
    }
}
