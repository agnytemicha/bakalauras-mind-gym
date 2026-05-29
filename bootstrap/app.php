<?php

use App\Http\Middleware\EnsureUserHasRole;
use App\Http\Middleware\HandleInertiaRequests;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use Illuminate\Http\Request;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware): void {
        $middleware->redirectGuestsTo(function (Request $request): string {
            if ($request->is('cms') || $request->is('cms/*') || $request->is('moderation') || $request->is('moderation/*')) {
                return route('admin.login');
            }

            return route('home');
        });

        $middleware->redirectUsersTo(function (Request $request): string {
            if ($request->is('cms') || $request->is('cms/*') || $request->is('moderation') || $request->is('moderation/*')) {
                return route('admin.games.index');
            }

            return route('profile.show');
        });

        $middleware->web(append: [
            HandleInertiaRequests::class,
        ]);

        $middleware->alias([
            'role' => EnsureUserHasRole::class,
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions): void {
        //
    })->create();
