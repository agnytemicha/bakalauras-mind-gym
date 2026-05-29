<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class LoginRequest extends FormRequest
{
    protected $errorBag = 'login';

    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'email' => ['required', 'email'],
            'password' => ['required', 'string'],
        ];
    }

    public function messages()
    {
        return [
            'email.required' => 'Privaloma įrašyti el. paštą.',
            'email.email' => 'Įrašykite teisingą el. pašto adresą.',
            'password.required' => 'Privaloma įrašyti slaptažodį.',
        ];
    }
}
