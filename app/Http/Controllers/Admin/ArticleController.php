<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\ArticleRequest;
use App\Http\Resources\Admin\ArticleFormResource;
use App\Http\Resources\Admin\ArticleListResource;
use App\Http\Resources\ArticleTagResource;
use App\Models\Article;
use App\Models\ArticleTag;
use App\Support\ArticleCatalogFilters;
use App\Support\MediaImageManager;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ArticleController extends Controller
{
    public function __construct(protected MediaImageManager $mediaImages) {}

    public function index(Request $request)
    {
        $filters = ArticleCatalogFilters::fromRequest($request);

        $articles = Article::query();

        $articles = ArticleCatalogFilters::apply($articles, $filters, searchAuthor: false);
        $articles = ArticleCatalogFilters::applySort($articles, $filters['sort'], useCreatedAt: false);
        $articleCards = [];

        foreach ($articles->get() as $article) {
            $articleCards[] = (new ArticleListResource($article))->resolve($request);
        }

        return Inertia::render('Admin/Articles/Index', [
            'filters' => $filters,
            'filterOptions' => ArticleCatalogFilters::options(),
            'hasActiveFilters' => ArticleCatalogFilters::hasActiveFilters($filters),
            'articles' => $articleCards,
        ]);
    }

    public function create(Request $request)
    {
        return Inertia::render('Admin/Articles/Create', [
            'article' => ArticleFormResource::empty(),
            'authorOptions' => ArticleCatalogFilters::authorOptions(),
            'tags' => $this->tagOptions($request),
        ]);
    }

    public function edit(Request $request, Article $article)
    {
        return Inertia::render('Admin/Articles/Edit', [
            'article' => (new ArticleFormResource($article))->resolve($request),
            'authorOptions' => ArticleCatalogFilters::authorOptions(),
            'tags' => $this->tagOptions($request),
        ]);
    }

    public function store(ArticleRequest $request)
    {
        $validated = $request->validated();

        $article = Article::query()->create($this->articleAttributes($validated));
        $this->syncTags($article, $validated['tag_ids'] ?? []);
        $this->mediaImages->sync(
            $article,
            $validated['images'] ?? [],
            $validated['image_order'] ?? [],
            $validated['removed_image_ids'] ?? [],
            single: true,
        );

        return redirect()
            ->route('admin.articles.edit', $article)
            ->with('success', 'Įrašas sukurtas.');
    }

    public function update(ArticleRequest $request, Article $article)
    {
        $validated = $request->validated();

        $article->update($this->articleAttributes($validated));
        $this->syncTags($article, $validated['tag_ids'] ?? []);
        $this->mediaImages->sync(
            $article,
            $validated['images'] ?? [],
            $validated['image_order'] ?? [],
            $validated['removed_image_ids'] ?? [],
            single: true,
        );

        return redirect()
            ->route('admin.articles.edit', $article)
            ->with('success', 'Įrašas atnaujintas.');
    }

    public function destroy(Article $article)
    {
        $this->mediaImages->deleteAll($article);
        $article->delete();

        return redirect()
            ->route('admin.articles.index')
            ->with('info', 'Įrašas pašalintas.');
    }

    protected function articleAttributes(array $validated)
    {
        return [
            'title' => (string) $validated['title'],
            'slug' => (string) $validated['slug'],
            'author' => trim((string) $validated['author']),
            'excerpt' => (string) $validated['excerpt'],
            'content' => (string) $validated['content'],
            'reading_time_minutes' => (int) $validated['reading_time_minutes'],
        ];
    }

    protected function syncTags(Article $article, array $tagIds)
    {
        $cleanTagIds = [];

        foreach ($tagIds as $tagId) {
            $tagId = (int) $tagId;

            if ($tagId > 0 && ! in_array($tagId, $cleanTagIds, true)) {
                $cleanTagIds[] = $tagId;
            }
        }

        $article->tags()->sync($cleanTagIds);
    }

    protected function tagOptions(Request $request)
    {
        $tags = [];

        foreach (ArticleTag::query()->orderBy('name')->get(['id', 'name', 'slug']) as $tag) {
            $tags[] = (new ArticleTagResource($tag))->resolve($request);
        }

        return $tags;
    }
}
