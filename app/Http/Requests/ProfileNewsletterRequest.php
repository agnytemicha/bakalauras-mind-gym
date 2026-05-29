<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProfileNewsletterRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'wants_newsletter' => ['required', 'boolean'],
            'wants_event_notifications' => ['required', 'boolean'],
            'wants_game_notifications' => ['required', 'boolean'],
            'wants_learning_notifications' => ['required', 'boolean'],
            'wants_event_reminders' => ['required', 'boolean'],
        ];
    }
}
