<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class ProfileUpdateRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        $today = now();
        $latestBirthDate = $today->copy()->subYears(7)->toDateString();
        $earliestBirthDate = $today->copy()->subYears(100)->addDay()->toDateString();

        return [
            'name' => ['required', 'string', 'max:255'],
            'last_name' => ['nullable', 'string', 'max:255'],
            'username' => [
                'required',
                'string',
                'max:255',
                'alpha_dash:ascii',
                Rule::unique('users', 'username')->ignore($this->user()->id),
            ],
            'birth_date' => [
                'required',
                'date_format:Y-m-d',
                "before_or_equal:{$latestBirthDate}",
                "after_or_equal:{$earliestBirthDate}",
            ],
        ];
    }

    public function messages()
    {
        return [
            'name.required' => 'Privaloma įrašyti vardą.',
            'username.required' => 'Privaloma įrašyti slapyvardį.',
            'username.alpha_dash' => 'Slapyvardį gali sudaryti tik raidės, skaičiai, brūkšneliai ir pabraukimo brūkšniai.',
            'username.unique' => 'Toks slapyvardis jau naudojamas.',
            'birth_date.required' => 'Privaloma įrašyti gimimo datą.',
            'birth_date.date_format' => 'Gimimo data turi būti YYYY-MM-DD formatu.',
            'birth_date.before_or_equal' => 'Gimimo data turi rodyti amžių nuo 7 iki 99 metų.',
            'birth_date.after_or_equal' => 'Gimimo data turi rodyti amžių nuo 7 iki 99 metų.',
        ];
    }
}
