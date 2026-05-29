<?php

namespace App\Support;

use App\Enums\GameDifficultyLevel;
use App\Models\Game;
use App\Models\GameTag;
use Illuminate\Http\Request;

class GameCatalogFilters
{
    private const SORT_OPTIONS = [
        'highest_rated' => 'Geriausiai įvertinti',
        'most_reviewed' => 'Daugiausia atsiliepimų',
        'newest' => 'Naujausi viršuje',
        'oldest' => 'Seniausi viršuje',
        'title_asc' => 'Pavadinimas A-Z',
        'title_desc' => 'Pavadinimas Z-A',
    ];

    private const PROFILE_FILTER_LABELS = [
        'age' => 'Amžius',
        'players' => 'Žaidėjai',
        'tag' => 'Kategorija',
        'difficulty' => 'Sunkumas',
    ];

    public static function fromRequest(Request $request, bool $includeSort = true)
    {
        $filters = [
            'age' => trim((string) $request->input('age', '')),
            'tag' => trim((string) $request->input('tag', '')),
            'difficulty' => trim((string) $request->input('difficulty', '')),
            'players' => trim((string) $request->input('players', '')),
        ];

        if ($includeSort) {
            $sort = trim((string) $request->input('sort', ''));
            $filters['sort'] = $sort !== '' ? $sort : 'highest_rated';
        }

        return $filters;
    }

    public static function withSearchFromRequest(Request $request)
    {
        return [
            'search' => trim((string) $request->input('search', '')),
            ...self::fromRequest($request),
        ];
    }

    public static function options(bool $includeSort = true)
    {
        $options = [
            'age' => [],
            'tag' => [],
            'difficulty' => [],
            'players' => [],
        ];

        foreach (range(4, 21) as $age) {
            $options['age'][] = [
                'value' => (string) $age,
                'label' => "{$age}+",
            ];
        }

        foreach (GameTag::query()->orderBy('name')->get(['name', 'slug']) as $tag) {
            $options['tag'][] = [
                'value' => $tag->slug,
                'label' => $tag->name,
            ];
        }

        foreach (GameDifficultyLevel::options() as $difficultyOption) {
            $options['difficulty'][] = $difficultyOption;
        }

        foreach (range(1, 20) as $players) {
            $options['players'][] = [
                'value' => (string) $players,
                'label' => (string) $players,
            ];
        }

        if ($includeSort) {
            $options['sort'] = [];

            foreach (self::SORT_OPTIONS as $value => $label) {
                $options['sort'][] = [
                    'value' => $value,
                    'label' => $label,
                ];
            }
        }

        return $options;
    }

    public static function profileControls(array $filters)
    {
        $options = self::options(false);
        $controls = [];

        foreach (self::PROFILE_FILTER_LABELS as $key => $label) {
            $controls[] = [
                'key' => $key,
                'value' => $filters[$key],
                'displayLabel' => self::profileFilterDisplayLabel($label, $filters[$key], $options[$key]),
                'options' => [
                    ['value' => '', 'label' => $label],
                    ...$options[$key],
                ],
            ];
        }

        return $controls;
    }

    public static function apply($query, array $filters)
    {
        if (($filters['age'] ?? '') !== '') {
            $query->where('age_rating', '>=', (int) $filters['age']);
        }

        if (($filters['tag'] ?? '') !== '') {
            $query->whereHas('tags', function ($tagQuery) use ($filters) {
                $tagQuery->where('slug', $filters['tag']);
            });
        }

        if (($filters['difficulty'] ?? '') !== '') {
            $query->whereIn('difficulty', Game::difficultySearchValues($filters['difficulty']));
        }

        if (($filters['players'] ?? '') !== '') {
            $query
                ->where('min_players', '<=', (int) $filters['players'])
                ->where('max_players', '>=', (int) $filters['players']);
        }

        return $query;
    }

    public static function applySort($query, string $sort)
    {
        if ($sort === 'most_reviewed') {
            return $query
                ->withCount('reviews')
                ->orderByDesc('reviews_count')
                ->latest('created_at')
                ->latest('id');
        }

        if ($sort === 'newest') {
            return $query
                ->latest('created_at')
                ->latest('id');
        }

        if ($sort === 'oldest') {
            return $query
                ->oldest('created_at')
                ->oldest('id');
        }

        if ($sort === 'title_asc') {
            return $query
                ->orderBy('title')
                ->orderBy('id');
        }

        if ($sort === 'title_desc') {
            return $query
                ->orderByDesc('title')
                ->orderByDesc('id');
        }

        return $query
            ->orderByDesc('rating')
            ->latest('created_at')
            ->latest('id');
    }

    public static function hasActiveFilters(array $filters)
    {
        foreach (array_keys(self::PROFILE_FILTER_LABELS) as $key) {
            if (($filters[$key] ?? '') !== '') {
                return true;
            }
        }

        return false;
    }

    private static function profileFilterDisplayLabel(string $label, string $value, array $options)
    {
        if ($value === '') {
            return $label;
        }

        $selectedOption = null;

        foreach ($options as $option) {
            if ($option['value'] === $value) {
                $selectedOption = $option;
                break;
            }
        }

        if ($selectedOption === null) {
            return $label;
        }

        return "{$label}: {$selectedOption['label']}";
    }
}
