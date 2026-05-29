<?php

namespace App\Http\Requests\Admin;

use App\Models\Article;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class ArticleRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        $article = $this->route('article');
        $articleId = $article instanceof Article ? $article->id : null;

        return [
            'title' => ['required', 'string', 'max:255'],
            'slug' => [
                'required',
                'string',
                'max:255',
                'alpha_dash:ascii',
                Rule::unique('articles', 'slug')->ignore($articleId),
            ],
            'author' => ['required', 'string', 'max:255'],
            'tag_ids' => ['nullable', 'array', 'max:4'],
            'tag_ids.*' => ['integer', Rule::exists('article_tags', 'id')],
            'excerpt' => ['required', 'string', 'max:600'],
            'content' => ['required', 'string'],
            'reading_time_minutes' => ['required', 'integer', 'between:1,60'],
            'image_order' => ['nullable', 'array', 'max:1'],
            'image_order.*' => ['string', 'regex:/^(existing:\d+|new:\d+)$/'],
            'images' => ['nullable', 'array', 'max:1'],
            'images.*' => ['image', 'mimes:jpg,jpeg,png,webp', 'max:20480'],
            'removed_image_ids' => ['sometimes', 'array'],
            'removed_image_ids.*' => ['integer'],
        ];
    }

    public function messages()
    {
        return [
            'tag_ids.max' => 'Galite pasirinkti daugiausia 4 žymas.',
        ];
    }
}
