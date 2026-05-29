<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class EnsureUserHasRole
{
    public function handle(Request $request, Closure $next, string $guard, string ...$roles)
    {
        $user = Auth::guard($guard)->user();

        abort_unless(in_array($user->role, $roles, true), 403);

        return $next($request);
    }
}
