<?php

namespace App\Http\Controllers;

use App\Http\Requests\ContactMessageRequest;
use App\Models\ContactMessage;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ContactController extends Controller
{
    public function index(Request $request)
    {
        return Inertia::render('InformationAboutUs', [
            'prefill' => [
                'name' => $request->user()?->name ?? '',
                'email' => $request->user()?->email ?? '',
            ],
        ]);
    }

    public function store(ContactMessageRequest $request)
    {
        $validated = $request->validated();

        ContactMessage::query()->create($validated + [
            'user_id' => $request->user()?->id,
        ]);

        return redirect('/information-about-us#susisiekite')
            ->with('success', 'Žinutė sėkmingai išsiųsta. Pasistengsime atrašyti kuo greičiau!');
    }
}
