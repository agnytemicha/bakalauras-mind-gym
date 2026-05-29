<?php

namespace App\Support;

use App\Enums\EventDifficultyLevel;
use App\Enums\EventPriceType;
use App\Models\Event;
use Carbon\CarbonImmutable;
use Carbon\CarbonInterface;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;

class EventCatalogFilters
{
    public const DEFAULT_SHOW = 'all';

    private const PLACE_OPTIONS = ['Vilnius', 'Kaunas', 'Klaipėda'];

    private const SHOW_OPTIONS = [
        'all' => 'Visi',
        'available' => 'Tik su laisvom vietom',
    ];

    private const DATE_OPTIONS = [
        'today' => 'Šiandien',
        'week' => 'Ši savaitė',
        'month' => 'Šis mėnuo',
        'year' => 'Šie metai',
    ];

    public static function fromRequest(Request $request)
    {
        $show = trim((string) $request->input('show', ''));

        return [
            'place' => trim((string) $request->input('place', '')),
            'difficulty' => trim((string) $request->input('difficulty', '')),
            'price' => trim((string) $request->input('price', '')),
            'show' => $show !== '' ? $show : self::DEFAULT_SHOW,
            'date' => trim((string) $request->input('date', '')),
        ];
    }

    public static function withSearchFromRequest(Request $request)
    {
        return [
            'search' => trim((string) $request->input('search', '')),
            ...self::fromRequest($request),
        ];
    }

    public static function options()
    {
        $options = [
            'place' => [],
            'difficulty' => [],
            'price' => EventPriceType::options(),
            'show' => [],
            'date' => [],
        ];

        foreach (self::PLACE_OPTIONS as $place) {
            $options['place'][] = [
                'value' => $place,
                'label' => $place,
            ];
        }

        foreach (EventDifficultyLevel::options() as $difficultyOption) {
            if ($difficultyOption['value'] !== EventDifficultyLevel::Everyone->value) {
                $options['difficulty'][] = $difficultyOption;
            }
        }

        foreach (self::SHOW_OPTIONS as $value => $label) {
            $options['show'][] = [
                'value' => $value,
                'label' => $label,
            ];
        }

        foreach (self::DATE_OPTIONS as $value => $label) {
            $options['date'][] = [
                'value' => $value,
                'label' => $label,
            ];
        }

        return $options;
    }

    public static function applyUpcoming(Builder $query, array $filters)
    {
        $dateRange = self::dateRange($filters['date'] ?? '');
        $query = self::applyCommon($query, $filters);

        $query->upcoming($dateRange['start']);

        if ($dateRange['end'] !== null) {
            $query->where('starts_at', '<=', $dateRange['end']);
        }

        return $query;
    }

    public static function applyAdmin(Builder $query, array $filters)
    {
        $dateRange = self::dateRange($filters['date'] ?? '');
        $query = self::applyCommon($query, $filters);

        if (($filters['date'] ?? '') !== '') {
            $query
                ->where('status', '!=', 'cancelled')
                ->where('starts_at', '>=', $dateRange['start']);

            if ($dateRange['end'] !== null) {
                $query->where('starts_at', '<=', $dateRange['end']);
            }
        }

        if (($filters['show'] ?? self::DEFAULT_SHOW) === 'available') {
            $query
                ->where('status', '!=', 'cancelled')
                ->where('starts_at', '>=', Event::nowInEventTimezone());
        }

        return $query;
    }

    public static function dateRange(string $date)
    {
        $start = CarbonImmutable::now(Event::EVENT_TIMEZONE);

        return [
            'start' => $start,
            'end' => match ($date) {
                'today' => $start->endOfDay(),
                'week' => $start->endOfWeek(CarbonInterface::SUNDAY),
                'month' => $start->endOfMonth(),
                'year' => $start->endOfYear(),
                default => null,
            },
        ];
    }

    protected static function applyCommon(Builder $query, array $filters)
    {
        if (($filters['place'] ?? '') !== '') {
            $query->where('location', 'like', "%{$filters['place']}%");
        }

        if (($filters['difficulty'] ?? '') !== '') {
            $query->where('difficulty_level', $filters['difficulty']);
        }

        if (($filters['price'] ?? '') !== '') {
            $query->where('price_type', $filters['price']);
        }

        return $query;
    }
}
