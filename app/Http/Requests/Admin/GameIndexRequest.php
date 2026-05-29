<?php

namespace App\Http\Requests\Admin;

use App\Support\GameCatalogFilters;
use Illuminate\Foundation\Http\FormRequest;

class GameIndexRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'search' => ['nullable', 'string', 'max:255'],
            'age' => ['nullable', 'string', 'max:20'],
            'tag' => ['nullable', 'string', 'max:255'],
            'difficulty' => ['nullable', 'string', 'max:50'],
            'players' => ['nullable', 'string', 'max:20'],
            'sort' => ['nullable', 'string', 'max:50'],
        ];
    }

    public function filters()
    {
        return GameCatalogFilters::withSearchFromRequest($this);
    }
}
