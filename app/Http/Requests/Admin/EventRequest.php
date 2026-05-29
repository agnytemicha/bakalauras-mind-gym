<?php

namespace App\Http\Requests\Admin;

use App\Enums\EventDifficultyLevel;
use App\Enums\EventPriceType;
use App\Models\Event;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class EventRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    protected function prepareForValidation()
    {
        $this->merge([
            'starts_at' => $this->dateTimeFromFields('starts_at_date', 'starts_at_time', 'starts_at'),
            'ends_at' => $this->dateTimeFromFields('ends_at_date', 'ends_at_time', 'ends_at'),
        ]);
    }

    public function rules()
    {
        $event = $this->routeEvent();

        return [
            'title' => ['required', 'string', 'max:255'],
            'slug' => [
                'required',
                'string',
                'max:255',
                'alpha_dash:ascii',
                Rule::unique('events', 'slug')->ignore($event?->id),
            ],
            'description' => ['required', 'string'],
            'starts_at' => ['required', 'date_format:Y-m-d H:i'],
            'ends_at' => ['nullable', 'date_format:Y-m-d H:i', 'after_or_equal:starts_at'],
            'location' => ['required', 'string', 'max:255'],
            'difficulty_level' => ['required', Rule::enum(EventDifficultyLevel::class)],
            'price_type' => ['required', Rule::enum(EventPriceType::class)],
            'seats_total' => ['required', 'integer', 'min:1', 'max:200'],
            'status' => ['required', Rule::in(['upcoming', 'cancelled', 'completed'])],
            'image_order' => ['nullable', 'array', 'max:1'],
            'image_order.*' => ['string', 'regex:/^(existing:\d+|new:\d+)$/'],
            'images' => ['nullable', 'array', 'max:1'],
            'images.*' => ['image', 'mimes:jpg,jpeg,png,webp', 'max:20480'],
            'removed_image_ids' => ['sometimes', 'array'],
            'removed_image_ids.*' => ['integer'],
        ];
    }

    protected function routeEvent()
    {
        $event = $this->route('event');

        return $event instanceof Event ? $event : null;
    }

    protected function dateTimeFromFields(string $dateField, string $timeField, string $fallbackField)
    {
        $date = trim((string) $this->input($dateField));
        $time = trim((string) $this->input($timeField));
        $fallback = trim((string) $this->input($fallbackField));

        if ($date === '' && $time === '') {
            return $fallback !== '' ? $fallback : null;
        }

        if ($date === '' || $time === '') {
            return 'invalid';
        }

        return $this->dateForValidation($date).' '.$time;
    }

    protected function dateForValidation(string $date)
    {
        if (preg_match('/^(\d{2})\/(\d{2})\/(\d{4})$/', $date, $matches)) {
            return "{$matches[3]}-{$matches[2]}-{$matches[1]}";
        }

        return $date;
    }
}
