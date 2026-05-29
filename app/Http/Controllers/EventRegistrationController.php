<?php

namespace App\Http\Controllers;

use App\Models\Event;
use Illuminate\Http\Request;

class EventRegistrationController extends Controller
{
    public function store(Request $request, Event $event)
    {
        abort_if($event->effectiveStatus() !== 'upcoming', 404);

        $userId = $request->user()->id;
        $alreadyRegistered = $event->registrations()
            ->where('user_id', $userId)
            ->exists();

        if ($alreadyRegistered) {
            return back()->with('info', 'Jūs jau esate užsiregistravę į šį renginį.');
        }

        if ($event->availableSeats() <= 0) {
            return back()->with('error', 'Deja, šiame renginyje laisvų vietų nebeliko.');
        }

        $event->registrations()->create([
            'user_id' => $userId,
        ]);

        return back()->with('success', 'Registracija sėkminga. Greitai susimatysime!');
    }

    public function destroy(Request $request, Event $event)
    {
        abort_if($event->effectiveStatus() !== 'upcoming', 404);

        $registration = $event->registrations()
            ->where('user_id', $request->user()->id)
            ->first();

        if (! $registration) {
            return back()->with('info', 'Jūs nesate užsiregistravę į šį renginį.');
        }

        $registration->delete();

        return back()->with('success', 'Registracija atšaukta.');
    }
}
