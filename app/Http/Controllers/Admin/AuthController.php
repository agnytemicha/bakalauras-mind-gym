<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\LoginRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;

class AuthController extends Controller
{
    public function create()
    {
        return Inertia::render('Admin/Login');
    }

    public function store(LoginRequest $request)
    {
        $credentials = $request->validated();

        if (! Auth::guard('cms')->attempt($credentials)) {
            throw ValidationException::withMessages([
                'email' => 'Neteisingas CMS el. paštas arba slaptažodis.',
            ]);
        }

        $user = Auth::guard('cms')->user();

        if (! $user->isAdmin()) {
            Auth::guard('cms')->logout();
            $request->session()->invalidate();
            $request->session()->regenerateToken();

            throw ValidationException::withMessages([
                'email' => 'Prisijungti prie CMS gali tik administratoriai.',
            ]);
        }

        $request->session()->regenerate();

        return redirect()->intended(route('admin.games.index'))
            ->with('success', 'Prisijungimas prie CMS sėkmingas.');
    }

    public function destroy(Request $request)
    {
        Auth::guard('cms')->logout();

        $request->session()->regenerate();
        $request->session()->regenerateToken();

        return to_route('admin.login')->with('info', 'Atsijungta nuo CMS.');
    }
}
