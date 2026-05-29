<?php

use App\Http\Controllers\Admin\ArticleController as AdminArticleController;
use App\Http\Controllers\Admin\AuthController as AdminAuthController;
use App\Http\Controllers\Admin\ContactMessageController as AdminContactMessageController;
use App\Http\Controllers\Admin\EventController as AdminEventController;
use App\Http\Controllers\Admin\GameController as AdminGameController;
use App\Http\Controllers\ArticleCommentController;
use App\Http\Controllers\ArticleCommentReplyController;
use App\Http\Controllers\ArticleController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\EventController;
use App\Http\Controllers\EventRegistrationController;
use App\Http\Controllers\FavoriteController;
use App\Http\Controllers\GameController;
use App\Http\Controllers\GameReviewCommentController;
use App\Http\Controllers\GameReviewController;
use App\Http\Controllers\GameShelfController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ProspectController;
use App\Http\Controllers\SearchController;
use Illuminate\Support\Facades\Route;

Route::get('/', [HomeController::class, 'index'])->name('home');

Route::get('/games', [GameController::class, 'index'])->name('games.index');
Route::get('/games/{game:slug}', [GameController::class, 'show'])->name('games.show');

Route::redirect('/blogs', '/blogs/all')->name('blogs.index');
Route::get('/blogs/all', [ArticleController::class, 'archive'])->name('blogs.archive');
Route::get('/blogs/{article:slug}', [ArticleController::class, 'show'])->name('blogs.show');

Route::get('/events', [EventController::class, 'index'])->name('events.index');
Route::get('/search', SearchController::class)->name('search.index');
Route::get('/prospects', [ProspectController::class, 'index'])->name('prospects.index');

Route::get('/information-about-us', [ContactController::class, 'index'])->name('public.information-about-us');
Route::post('/information-about-us', [ContactController::class, 'store'])->name('public.information-about-us.store');
Route::redirect('/contact', '/information-about-us#susisiekite')->name('contact.index');
Route::post('/contact', [ContactController::class, 'store'])->name('contact.store');
Route::redirect('/contact-us', '/information-about-us#susisiekite')->name('public.contact-us');
Route::redirect('/contacts', '/information-about-us#kontaktai')->name('public.contacts');
Route::redirect('/about-us', '/information-about-us#apie-mus')->name('public.about-us');

Route::post('/login', [AuthController::class, 'store'])->name('auth.login');
Route::post('/register', [AuthController::class, 'register'])->name('auth.register');
Route::post('/logout', [AuthController::class, 'destroy'])->middleware('auth:web')->name('auth.logout');

Route::middleware('auth:web')->group(function () {
    Route::get('/profile', [ProfileController::class, 'show'])->name('profile.show');
    Route::put('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::post('/profile/photo', [ProfileController::class, 'updatePhoto'])->name('profile.photo');
    Route::put('/profile/newsletter', [ProfileController::class, 'updateNewsletter'])->name('profile.newsletter');
    Route::put('/profile/email', [ProfileController::class, 'updateEmail'])->name('profile.email');
    Route::put('/profile/password', [ProfileController::class, 'updatePassword'])->name('profile.password');

    Route::post('/games/{game:slug}/favorite', [FavoriteController::class, 'toggle'])->name('games.favorite');
    Route::post('/games/{game:slug}/owned', [GameShelfController::class, 'toggleOwned'])->name('games.owned');
    Route::post('/games/{game:slug}/wishlist', [GameShelfController::class, 'toggleWishlist'])->name('games.wishlist');
    Route::post('/games/{game:slug}/reviews', [GameReviewController::class, 'store'])->name('games.reviews.store');
    Route::post('/games/{game:slug}/reviews/{review}/comments', [GameReviewCommentController::class, 'store'])->name('games.review-comments.store');
    Route::post('/blogs/{article:slug}/comments', [ArticleCommentController::class, 'store'])->name('blogs.comments.store');
    Route::post('/blogs/{article:slug}/comments/{comment}/replies', [ArticleCommentReplyController::class, 'store'])->name('blogs.comment-replies.store');
    Route::post('/events/{event:slug}/register', [EventRegistrationController::class, 'store'])->name('events.register');
    Route::delete('/events/{event:slug}/register', [EventRegistrationController::class, 'destroy'])->name('events.unregister');
});

Route::prefix('cms')->name('admin.')->group(function () {
    Route::redirect('/', '/cms/games')->name('dashboard');

    Route::middleware('guest:cms')->group(function () {
        Route::get('/login', [AdminAuthController::class, 'create'])->name('login');
        Route::post('/login', [AdminAuthController::class, 'store'])->name('authenticate');
    });

    Route::middleware(['auth:cms', 'role:cms,admin'])->group(function () {
        Route::get('/games', [AdminGameController::class, 'index'])->name('games.index');
        Route::get('/games/create', [AdminGameController::class, 'create'])->name('games.create');
        Route::get('/games/{game}/edit', [AdminGameController::class, 'edit'])->name('games.edit');
        Route::get('/articles', [AdminArticleController::class, 'index'])->name('articles.index');
        Route::get('/articles/create', [AdminArticleController::class, 'create'])->name('articles.create');
        Route::get('/articles/{article}/edit', [AdminArticleController::class, 'edit'])->name('articles.edit');
        Route::get('/events', [AdminEventController::class, 'index'])->name('events.index');
        Route::get('/events/create', [AdminEventController::class, 'create'])->name('events.create');
        Route::get('/events/{event}/edit', [AdminEventController::class, 'edit'])->name('events.edit');
        Route::get('/contact-messages', [AdminContactMessageController::class, 'index'])->name('contact-messages.index');
        Route::post('/games', [AdminGameController::class, 'store'])->name('games.store');
        Route::put('/games/{game}', [AdminGameController::class, 'update'])->name('games.update');
        Route::delete('/games/{game}', [AdminGameController::class, 'destroy'])->name('games.destroy');

        Route::post('/articles', [AdminArticleController::class, 'store'])->name('articles.store');
        Route::put('/articles/{article}', [AdminArticleController::class, 'update'])->name('articles.update');
        Route::delete('/articles/{article}', [AdminArticleController::class, 'destroy'])->name('articles.destroy');

        Route::post('/events', [AdminEventController::class, 'store'])->name('events.store');
        Route::put('/events/{event}', [AdminEventController::class, 'update'])->name('events.update');
        Route::delete('/events/{event}', [AdminEventController::class, 'destroy'])->name('events.destroy');

        Route::delete('/contact-messages/{message}', [AdminContactMessageController::class, 'destroy'])->name('contact-messages.destroy');
    });

    Route::post('/logout', [AdminAuthController::class, 'destroy'])->middleware('auth:cms')->name('logout');
});
