<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Resources\Admin\ContactMessageResource;
use App\Models\ContactMessage;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ContactMessageController extends Controller
{
    public function index(Request $request)
    {
        $messages = [];

        foreach (ContactMessage::query()->latest()->get() as $message) {
            $messages[] = (new ContactMessageResource($message))->resolve($request);
        }

        return Inertia::render('Admin/ContactMessages/Index', [
            'messages' => $messages,
        ]);
    }

    public function destroy(ContactMessage $message)
    {
        $message->delete();

        return back()->with('success', 'Kontaktinė žinutė pašalinta.');
    }
}
