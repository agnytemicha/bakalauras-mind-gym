<?php

namespace App\Http\Controllers\Admin;

use App\Enums\GameDifficultyLevel;
use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\GameIndexRequest;
use App\Http\Requests\Admin\GameRequest;
use App\Http\Resources\Admin\GameFormResource;
use App\Http\Resources\Admin\GameListResource;
use App\Http\Resources\GameTagResource;
use App\Http\Resources\PaginationResource;
use App\Models\Game;
use App\Models\GameTag;
use App\Support\GameCatalogFilters;
use App\Support\MediaImageManager;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Inertia\Inertia;

class GameController extends Controller
{
    public function __construct(protected MediaImageManager $mediaImages) {}

    public function index(GameIndexRequest $request)
    {
        $filters = $request->filters();

        $games = Game::query();

        if ($filters['search'] !== '') {
            $search = $filters['search'];

            $games->where(function ($gameQuery) use ($search) {
                $gameQuery
                    ->where('title', 'like', "%{$search}%")
                    ->orWhere('description', 'like', "%{$search}%")
                    ->orWhere('difficulty', 'like', "%{$search}%");

                $difficultyValues = Game::difficultySearchValues($search);

                if ($difficultyValues !== []) {
                    $gameQuery->orWhereIn('difficulty', $difficultyValues);
                }
            });
        }

        $games = GameCatalogFilters::apply($games, $filters);
        $games = GameCatalogFilters::applySort($games, $filters['sort']);

        $games = $games->paginate(10)->withQueryString();
        $gameCards = [];

        foreach ($games as $game) {
            $gameCards[] = (new GameListResource($game))->resolve($request);
        }

        return Inertia::render('Admin/Games/Index', [
            'filters' => $filters,
            'filterOptions' => GameCatalogFilters::options(),
            'games' => ['data' => $gameCards],
            'pagination' => (new PaginationResource($games))->resolve($request),
        ]);
    }

    public function create(Request $request)
    {
        return Inertia::render('Admin/Games/Create', [
            'tags' => $this->tagOptions($request),
            'difficultyOptions' => GameDifficultyLevel::values(),
            'game' => GameFormResource::empty(),
        ]);
    }

    public function edit(Request $request, Game $game)
    {
        return Inertia::render('Admin/Games/Edit', [
            'tags' => $this->tagOptions($request),
            'difficultyOptions' => GameDifficultyLevel::values(),
            'game' => (new GameFormResource($game))->resolve($request),
        ]);
    }

    public function store(GameRequest $request)
    {
        $validated = $request->validated();
        $rules = trim((string) ($validated['rules'] ?? ''));
        $playTipBlocks = Game::cleanPlayTipBlocks($validated['play_tip_blocks'] ?? []);
        $videoBlocks = Game::cleanVideoBlocks($validated['video_blocks'] ?? []);
        $minPlayers = (int) $validated['min_players'];
        $maxPlayers = $validated['players_mode'] === 'exact'
            ? $minPlayers
            : (int) $validated['max_players'];

        $game = new Game;

        $game->fill([
            'title' => (string) $validated['title'],
            'slug' => $this->generateUniqueSlug((string) $validated['title']),
            'description' => (string) $validated['description'],
            'min_players' => $minPlayers,
            'max_players' => $maxPlayers,
            'age_rating' => (int) $validated['age_rating'],
            'duration_minutes' => (int) $validated['duration_minutes'],
            'difficulty' => Game::difficultyValue((string) $validated['difficulty']),
            'featured' => (bool) $validated['featured'],
            'play_tips_blocks' => $playTipBlocks !== [] ? $playTipBlocks : null,
            'video_blocks' => $videoBlocks !== [] ? $videoBlocks : null,
            'rules' => $rules !== '' ? $rules : null,
        ]);
        $game->save();

        if ((bool) $validated['featured']) {
            Game::query()
                ->where('featured', true)
                ->whereKeyNot($game->id)
                ->update(['featured' => false]);
        }

        $game->tags()->sync($validated['tag_ids'] ?? []);

        $this->mediaImages->sync(
            $game,
            $validated['images'] ?? [],
            $validated['image_order'] ?? [],
            $validated['removed_image_ids'] ?? [],
        );
        $this->syncRuleBooks($game, $validated);

        return redirect()
            ->route('admin.games.edit', $game)
            ->with('success', 'Žaidimas sukurtas.');
    }

    public function update(GameRequest $request, Game $game)
    {
        $validated = $request->validated();
        $rules = trim((string) ($validated['rules'] ?? ''));
        $playTipBlocks = Game::cleanPlayTipBlocks($validated['play_tip_blocks'] ?? []);
        $videoBlocks = Game::cleanVideoBlocks($validated['video_blocks'] ?? []);
        $minPlayers = (int) $validated['min_players'];
        $maxPlayers = $validated['players_mode'] === 'exact'
            ? $minPlayers
            : (int) $validated['max_players'];

        $game->fill([
            'title' => (string) $validated['title'],
            'description' => (string) $validated['description'],
            'min_players' => $minPlayers,
            'max_players' => $maxPlayers,
            'age_rating' => (int) $validated['age_rating'],
            'duration_minutes' => (int) $validated['duration_minutes'],
            'difficulty' => Game::difficultyValue((string) $validated['difficulty']),
            'featured' => (bool) $validated['featured'],
            'play_tips_blocks' => $playTipBlocks !== [] ? $playTipBlocks : null,
            'video_blocks' => $videoBlocks !== [] ? $videoBlocks : null,
            'rules' => $rules !== '' ? $rules : null,
        ]);
        $game->save();

        if ((bool) $validated['featured']) {
            Game::query()
                ->where('featured', true)
                ->whereKeyNot($game->id)
                ->update(['featured' => false]);
        }

        $game->tags()->sync($validated['tag_ids'] ?? []);

        $this->mediaImages->sync(
            $game,
            $validated['images'] ?? [],
            $validated['image_order'] ?? [],
            $validated['removed_image_ids'] ?? [],
        );
        $this->syncRuleBooks($game, $validated);

        return redirect()
            ->route('admin.games.edit', $game)
            ->with('success', 'Žaidimo informacija atnaujinta.');
    }

    public function destroy(Game $game)
    {
        $this->mediaImages->deleteAll($game);

        $ruleBookPaths = [];

        foreach ($game->rulebook_files ?? [] as $file) {
            $path = (string) ($file['path'] ?? '');

            if ($path !== '') {
                $ruleBookPaths[] = $path;
            }
        }

        if ($ruleBookPaths !== []) {
            Storage::disk('public')->delete($ruleBookPaths);
        }

        Storage::disk('public')->deleteDirectory("games/{$game->id}/rule-books");
        $game->delete();

        return redirect()
            ->route('admin.games.index')
            ->with('info', 'Žaidimas pašalintas.');
    }

    protected function syncRuleBooks(Game $game, array $validated)
    {
        $existingRuleBooks = $game->rulebook_files ?? [];
        $removedRuleBookPaths = [];

        foreach ($validated['remove_rule_book_paths'] ?? [] as $path) {
            $path = trim((string) $path);

            if ($path !== '') {
                $removedRuleBookPaths[] = $path;
            }
        }

        $ruleBookPathsToDelete = $this->ruleBookPathsToDelete($existingRuleBooks, $removedRuleBookPaths);
        if ($ruleBookPathsToDelete !== []) {
            Storage::disk('public')->delete($ruleBookPathsToDelete);
        }

        $ruleBookFiles = $this->remainingRuleBooks($existingRuleBooks, $removedRuleBookPaths);

        foreach ($validated['rule_books'] ?? [] as $ruleBook) {
            $ruleBookFiles[] = $this->storedRuleBook($game, $ruleBook);
        }

        $game->forceFill([
            'rulebook_files' => $ruleBookFiles !== [] ? $ruleBookFiles : null,
        ])->save();
    }

    protected function ruleBookPathsToDelete($existingRuleBooks, $removedRuleBookPaths)
    {
        $paths = [];

        foreach ($existingRuleBooks as $file) {
            $path = (string) ($file['path'] ?? '');

            if (in_array($path, $removedRuleBookPaths, true)) {
                $paths[] = $path;
            }
        }

        return $paths;
    }

    protected function remainingRuleBooks($existingRuleBooks, $removedRuleBookPaths)
    {
        $files = [];

        foreach ($existingRuleBooks as $file) {
            if (! in_array($file['path'] ?? null, $removedRuleBookPaths, true)) {
                $files[] = $file;
            }
        }

        return $files;
    }

    protected function storedRuleBook(Game $game, $ruleBook)
    {
        return [
            'name' => $ruleBook->getClientOriginalName(),
            'path' => $ruleBook->store("games/{$game->id}/rule-books", 'public'),
        ];
    }

    protected function generateUniqueSlug(string $title)
    {
        $baseSlug = Str::slug($title);
        $rootSlug = $baseSlug !== '' ? $baseSlug : 'zaidimas';
        $slug = $rootSlug;
        $suffix = 2;

        while (Game::query()->where('slug', $slug)->exists()) {
            $slug = "{$rootSlug}-{$suffix}";
            $suffix++;
        }

        return $slug;
    }

    protected function tagOptions(Request $request)
    {
        $tags = [];

        foreach (GameTag::query()->orderBy('name')->get(['id', 'name', 'slug']) as $tag) {
            $tags[] = (new GameTagResource($tag))->resolve($request);
        }

        return $tags;
    }
}
