<?php

namespace App\Http\Controllers;

use App\Http\Requests\LoginRequest;
use App\Http\Requests\RegisterRequest;
use App\Models\CmsUser;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    public function store(LoginRequest $request)
    {
        $credentials = $request->validated();

        if (CmsUser::query()->where('email', $credentials['email'])->exists()) {
            throw $this->loginError('CMS darbuotojai jungiasi per /cms.');
        }

        if (! Auth::guard('web')->attempt($credentials)) {
            throw $this->loginError('Neteisingi prisijungimo duomenys.');
        }

        $request->session()->regenerate();

        return redirect()->back()->with('success', 'Sėkmingai prisijungta prie Mind Gym.');
    }

    public function register(RegisterRequest $request)
    {
        $validated = $request->validated();

        $user = User::query()->create([
            'name' => $validated['name'],
            'username' => $validated['username'],
            'birth_date' => $validated['birth_date'],
            'email' => $validated['email'],
            'role' => 'member',
            'password' => Hash::make($validated['password']),
        ]);

        Auth::guard('web')->login($user);
        $request->session()->regenerate();

        return redirect()->back()->with('success', 'Registracija sėkminga. Sveiki atvykę į Mind Gym!');
    }

    public function destroy(Request $request)
    {
        Auth::guard('web')->logout();

        $request->session()->regenerate();
        $request->session()->regenerateToken();

        return to_route('home')->with('info', 'Atsijungta nuo paskyros.');
    }

    private function loginError(string $message)
    {
        $exception = ValidationException::withMessages([
            'login' => $message,
        ]);

        $exception->errorBag = 'login';

        return $exception;
    }
}
