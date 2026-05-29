<?php

namespace App\Http\Middleware;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Middleware;

class HandleInertiaRequests extends Middleware
{
    protected $rootView = 'app';

    /**
     * Determine the current asset version.
     */
    public function version(Request $request)
    {
        return parent::version($request);
    }

    /**
     * Define the props that are shared by default.
     */
    public function share(Request $request)
    {
        $publicUser = Auth::guard('web')->user();
        $cmsUser = Auth::guard('cms')->user();
        $isBackOfficeRequest = $request->routeIs('admin.*');

        return [
            ...parent::share($request),
            'auth' => [
                'user' => $publicUser ? [
                    'id' => $publicUser->id,
                    'name' => $publicUser->name,
                    'username' => $publicUser->username,
                    'email' => $publicUser->email,
                    'birthDate' => $publicUser->birth_date?->format('Y-m-d'),
                    'role' => $publicUser->role,
                    'favoriteCount' => $publicUser->favorites()->count(),
                    'registrationCount' => $publicUser->eventRegistrations()->count(),
                ] : null,
            ],
            'cmsAuth' => [
                'user' => $isBackOfficeRequest && $cmsUser ? [
                    'id' => $cmsUser->id,
                    'name' => $cmsUser->name,
                    'email' => $cmsUser->email,
                    'role' => $cmsUser->role,
                    'roleLabel' => $cmsUser->roleLabel(),
                ] : null,
            ],
            'flash' => $this->flashMessage($request),
            'navigation' => [
                'main' => [
                    ['label' => 'Stalo žaidimai', 'href' => '/games'],
                    ['label' => 'Renginiai', 'href' => '/events'],
                    ['label' => 'Tinklaraštis', 'href' => '/blogs/all', 'activeStartsWith' => '/blogs'],
                    ['label' => 'Perspektyvos', 'href' => '/prospects'],
                ],
                'member' => [
                    ['label' => 'Profilis', 'href' => '/profile'],
                ],
            ],
            'site' => [
                'name' => 'Mind Gym',
                'tagline' => 'Stalo žaidimų bendruomenė, kuri augina smalsumą.',
                'heroTitle' => 'Atrask naujus stalo žaidimus ir žmones, su kuriais gera žaisti.',
                'heroSubtitle' => 'Mind Gym sujungia žaidimų rekomendacijas, aiškius paaiškinimus, renginius ir bendruomenės įspūdžius vienoje vietoje.',
                'aboutTitle' => 'Kodėl Mind Gym?',
                'aboutBody' => 'Čia lengva rasti tiek vakarėlio žaidimus, tiek strategiškesnius favoritų vakarus. Kiekvienas aprašymas parašytas paprastai, kad galėtum greitai nuspręsti, ką žaisti toliau.',
                'contactEmail' => 'labas@mindgym.lt',
                'contactPhone' => '+370 612 34567',
                'contactAddress' => 'Vilnius, Lietuva',
                'facebookUrl' => 'https://facebook.com',
                'instagramUrl' => 'https://instagram.com',
                'tiktokUrl' => 'https://tiktok.com',
                'footerNote' => 'Sukurta tam, kad žaidimų vakarai būtų dar paprastesni.',
            ],
        ];
    }

    protected function flashMessage(Request $request)
    {
        if (! $request->hasSession()) {
            return null;
        }

        foreach (['success', 'error', 'info'] as $type) {
            $message = $request->session()->get($type);

            if (! is_string($message)) {
                continue;
            }

            $text = trim($message);

            if ($text !== '') {
                return [
                    'type' => $type,
                    'text' => $text,
                    'duration' => $this->flashDuration($text),
                ];
            }
        }

        return null;
    }

    protected function flashDuration(string $text)
    {
        if (strlen($text) <= 55) {
            return 5000;
        }

        if (strlen($text) <= 110) {
            return 6500;
        }

        return 8000;
    }
}
