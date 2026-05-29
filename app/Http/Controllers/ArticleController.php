<?php

namespace App\Http\Controllers;

use App\Http\Resources\ArticleCardResource;
use App\Http\Resources\ArticleDetailResource;
use App\Http\Resources\PaginationResource;
use App\Models\Article;
use App\Support\ArticleCatalogFilters;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ArticleController extends Controller
{
    public function archive(Request $request)
    {
        $filters = ArticleCatalogFilters::fromRequest($request);

        $articleQuery = Article::query();

        $articleQuery = ArticleCatalogFilters::apply($articleQuery, $filters);
        $articleQuery = ArticleCatalogFilters::applySort($articleQuery, $filters['sort']);

        $articles = $articleQuery->paginate(9)->withQueryString();
        $articleCards = [];

        foreach ($articles as $article) {
            $articleCards[] = (new ArticleCardResource($article))->resolve($request);
        }

        return Inertia::render('Articles/Index', [
            'filters' => $filters,
            'filterOptions' => ArticleCatalogFilters::options(),
            'articles' => ['data' => $articleCards],
            'resultSummary' => "Rasta {$articles->total()} straipsnių",
            'pagination' => (new PaginationResource($articles, 'straipsnių'))->resolve($request),
        ]);
    }

    public function show(Request $request, Article $article)
    {
        $relatedArticles = Article::query()
            ->whereKeyNot($article->id)
            ->latest('created_at')
            ->latest('id')
            ->take(3)
            ->get();
        $relatedArticleCards = [];

        foreach ($relatedArticles as $relatedArticle) {
            $relatedArticleCards[] = (new ArticleCardResource($relatedArticle))->resolve($request);
        }

        return Inertia::render('Articles/Show', [
            'article' => (new ArticleDetailResource($article))->resolve($request),
            'relatedArticles' => $relatedArticleCards,
        ]);
    }
}
