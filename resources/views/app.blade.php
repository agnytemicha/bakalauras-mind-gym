<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title inertia>{{ config('app.name', 'Mind Gym') }}</title>
        <link rel="icon" type="image/svg+xml" href="{{ Vite::asset('resources/images/brand/logo.svg') }}">
        @routes
        @vite(['resources/css/app.css', 'resources/js/app.js'])
        @inertiaHead
    </head>
    <body class="min-h-screen font-sans antialiased">
        @inertia
    </body>
</html>
