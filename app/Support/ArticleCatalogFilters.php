<?php

namespace App\Support;

use App\Models\Article;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;

class ArticleCatalogFilters
{
    public const DEFAULT_SORT = 'newest';

    private const SORT_OPTIONS = [
        'most_commented' => 'Daugiausia komentarų',
        'newest' => 'Naujausi viršuje',
        'oldest' => 'Seniausi viršuje',
        'title_asc' => 'Pavadinimas A-Z',
        'title_desc' => 'Pavadinimas Z-A',
    ];

    public static function fromRequest(Request $request)
    {
        $sort = trim((string) $request->input('sort', ''));

        return [
            'search' => trim((string) $request->input('search', '')),
            'author' => trim((string) $request->input('author', '')),
            'sort' => $sort !== '' ? $sort : self::DEFAULT_SORT,
        ];
    }

    public static function options()
    {
        $sortOptions = [];

        foreach (self::SORT_OPTIONS as $value => $label) {
            $sortOptions[] = [
                'value' => $value,
                'label' => $label,
            ];
        }

        return [
            'author' => self::authorOptions(),
            'sort' => $sortOptions,
        ];
    }

    public static function authorOptions()
    {
        $authors = [];
        $authorOptions = [];

        foreach (Article::query()->pluck('author')->all() as $author) {
            $author = trim((string) $author);

            if ($author !== '') {
                $authors[$author] = $author;
            }
        }

        natcasesort($authors);

        foreach ($authors as $author) {
            $authorOptions[] = [
                'value' => $author,
                'label' => $author,
            ];
        }

        return $authorOptions;
    }

    public static function apply(
        Builder $query,
        array $filters,
        bool $searchAuthor = true,
    ) {
        if ($filters['search'] !== '') {
            $query->where(function (Builder $articleQuery) use ($filters, $searchAuthor) {
                $articleQuery
                    ->where('title', 'like', "%{$filters['search']}%")
                    ->orWhere('excerpt', 'like', "%{$filters['search']}%");

                if ($searchAuthor) {
                    $articleQuery->orWhere('author', 'like', "%{$filters['search']}%");
                }
            });
        }

        if ($filters['author'] !== '') {
            $query->where('author', $filters['author']);
        }

        return $query;
    }

    public static function applySort(Builder $query, string $sort, bool $useCreatedAt = true)
    {
        if ($sort === 'most_commented') {
            $query->withCount('comments');
            $query->orderByDesc('comments_count');

            return $useCreatedAt
                ? $query->orderByDesc('created_at')->orderByDesc('id')
                : $query->latest('id');
        }

        if ($sort === 'oldest') {
            return $useCreatedAt
                ? $query->orderBy('created_at')->orderBy('id')
                : $query->oldest('id');
        }

        if ($sort === 'title_asc') {
            return $query->orderBy('title')->orderBy('id');
        }

        if ($sort === 'title_desc') {
            return $query->orderByDesc('title')->orderByDesc('id');
        }

        return $useCreatedAt
            ? $query->orderByDesc('created_at')->orderByDesc('id')
            : $query->latest('id');
    }

    public static function hasActiveFilters(array $filters)
    {
        return ($filters['search'] ?? '') !== ''
            || ($filters['author'] ?? '') !== ''
            || ($filters['sort'] ?? self::DEFAULT_SORT) !== self::DEFAULT_SORT;
    }
}
