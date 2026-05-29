<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class ProfileEmailRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'email' => [
                'required',
                'email',
                'max:255',
                Rule::unique('users', 'email')->ignore($this->user()->id),
                Rule::unique('cms_users', 'email'),
            ],
        ];
    }

    public function messages()
    {
        return [
            'email.required' => 'Privaloma įrašyti el. paštą.',
            'email.email' => 'Įrašykite teisingą el. pašto adresą.',
            'email.unique' => 'Toks el. pašto adresas jau naudojamas.',
        ];
    }
}
