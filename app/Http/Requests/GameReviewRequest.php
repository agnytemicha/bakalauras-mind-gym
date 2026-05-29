<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class GameReviewRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'rating' => ['required', 'integer', 'between:1,5'],
            'body' => ['required', 'string', 'max:1200'],
        ];
    }
}
