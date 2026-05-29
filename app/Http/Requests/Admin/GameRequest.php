<?php

namespace App\Http\Requests\Admin;

use App\Enums\GameDifficultyLevel;
use App\Models\Game;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class GameRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    protected function prepareForValidation()
    {
        $data = [
            'play_tip_blocks' => $this->filledPlayTipBlocks(),
            'video_blocks' => $this->filledVideoBlocks(),
        ];

        if ($this->input('players_mode') === 'exact') {
            $data['max_players'] = $this->input('min_players');
        }

        $this->merge($data);
    }

    public function rules()
    {
        return [
            'title' => ['required', 'string', 'max:255'],
            'tag_ids' => ['nullable', 'array', 'max:4'],
            'tag_ids.*' => ['integer', Rule::exists('game_tags', 'id')],
            'duration_minutes' => ['required', 'integer', 'between:10,300'],
            'age_rating' => [
                'required',
                'integer',
                'between:4,21',
            ],
            'players_mode' => ['required', Rule::in(['exact', 'range'])],
            'min_players' => [
                'required',
                'integer',
                'min:1',
                'max:20',
            ],
            'max_players' => [
                Rule::requiredIf(fn () => $this->input('players_mode') === 'range'),
                'nullable',
                'integer',
                'min:1',
                'max:20',
                'gte:min_players',
            ],
            'difficulty' => ['required', Rule::enum(GameDifficultyLevel::class)],
            'featured' => ['required', 'boolean'],
            'description' => ['required', 'string'],
            'rules' => ['nullable', 'string'],
            'play_tip_blocks' => ['nullable', 'array'],
            'play_tip_blocks.*.title' => ['required', 'string', 'max:255'],
            'play_tip_blocks.*.body' => ['required', 'string'],
            'video_blocks' => ['nullable', 'array', 'max:3'],
            'video_blocks.*.title' => ['required', 'string', 'max:255'],
            'video_blocks.*.author' => ['required', 'string', 'max:255'],
            'video_blocks.*.youtube_url' => ['required', 'string', 'max:2048'],
            'image_order' => $this->routeGame() === null
                ? ['required', 'array', 'min:1', 'max:10']
                : ['nullable', 'array', 'max:10'],
            'image_order.*' => ['string', 'regex:/^(existing:\d+|new:\d+)$/'],
            'images' => ['nullable', 'array', 'max:10'],
            'images.*' => ['image', 'mimes:jpg,jpeg,png,webp', 'max:20480'],
            'removed_image_ids' => ['sometimes', 'array'],
            'removed_image_ids.*' => ['integer'],
            'rule_books' => ['nullable', 'array', 'max:5'],
            'rule_books.*' => ['file', 'mimetypes:application/pdf', 'max:20480'],
            'remove_rule_book_paths' => ['sometimes', 'array'],
            'remove_rule_book_paths.*' => ['string'],
        ];
    }

    public function messages()
    {
        return [
            'players_mode.required' => 'Pasirinkite žaidėjų skaičiaus tipą.',
            'tag_ids.max' => 'Galite pasirinkti daugiausia 4 kategorijas.',
            'min_players.required' => 'Įrašykite žaidėjų skaičių.',
            'max_players.required' => 'Įrašykite didžiausią žaidėjų skaičių.',
            'max_players.gte' => 'Laukas "Iki" turi būti didesnis arba lygus laukui "Nuo".',
            'video_blocks.max' => 'Galite pridėti daugiausia 3 vaizdo įrašus.',
            'image_order.required' => 'Pridėkite bent vieną nuotrauką.',
            'image_order.min' => 'Pridėkite bent vieną nuotrauką.',
        ];
    }

    protected function filledPlayTipBlocks()
    {
        $blocks = [];

        foreach ($this->input('play_tip_blocks', []) as $block) {
            if (! is_array($block)) {
                continue;
            }

            $title = trim((string) ($block['title'] ?? ''));
            $body = trim((string) ($block['body'] ?? ''));

            if ($title !== '' || $body !== '') {
                $blocks[] = [
                    'title' => $title,
                    'body' => $body,
                ];
            }
        }

        return $blocks;
    }

    protected function filledVideoBlocks()
    {
        $blocks = [];

        foreach ($this->input('video_blocks', []) as $block) {
            if (! is_array($block)) {
                continue;
            }

            $title = trim((string) ($block['title'] ?? ''));
            $author = trim((string) ($block['author'] ?? ''));
            $youtubeUrl = trim((string) ($block['youtube_url'] ?? ''));

            if ($title !== '' || $author !== '' || $youtubeUrl !== '') {
                $blocks[] = [
                    'title' => $title,
                    'author' => $author,
                    'youtube_url' => $youtubeUrl,
                ];
            }
        }

        return $blocks;
    }

    protected function routeGame()
    {
        $game = $this->route('game');

        return $game instanceof Game ? $game : null;
    }
}
