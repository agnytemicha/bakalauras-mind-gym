<?php

namespace App\Models;

use App\Models\Concerns\HasMediaImages;
use DateTimeInterface;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;

class Event extends Model
{
    use HasMediaImages;

    public const EVENT_TIMEZONE = 'Europe/Vilnius';

    protected $fillable = [
        'title',
        'slug',
        'description',
        'starts_at',
        'ends_at',
        'location',
        'difficulty_level',
        'price_type',
        'seats_total',
        'status',
    ];

    public function startsAtDate()
    {
        return self::eventDateTimeFromStorage($this->starts_at);
    }

    public function endsAtDate()
    {
        return self::eventDateTimeFromStorage($this->ends_at);
    }

    public static function dateTimeForStorage($value)
    {
        return self::eventDateTimeForStorage($value);
    }

    public function registrations()
    {
        return $this->hasMany(EventRegistration::class);
    }

    public function scopeUpcoming(Builder $query, mixed $from = null)
    {
        return $query
            ->where('status', '!=', 'cancelled')
            ->where('starts_at', '>=', self::eventDateTimeForStorage($from ?? self::nowInEventTimezone()));
    }

    public function scopePast(Builder $query, mixed $until = null)
    {
        return $query
            ->where('status', '!=', 'cancelled')
            ->where('starts_at', '<', self::eventDateTimeForStorage($until ?? self::nowInEventTimezone()));
    }

    public function confirmedRegistrationsCount()
    {
        return $this->registrations()
            ->where('status', 'confirmed')
            ->count();
    }

    public function availableSeats()
    {
        return max(0, $this->seats_total - $this->confirmedRegistrationsCount());
    }

    public static function nowInEventTimezone()
    {
        return Carbon::now(self::EVENT_TIMEZONE);
    }

    public static function automaticStatusFor(mixed $startsAt, mixed $reference = null)
    {
        $eventStartsAt = self::eventDateTimeFromStorage($startsAt);

        if (! $eventStartsAt) {
            return 'upcoming';
        }

        $comparisonPoint = $reference instanceof DateTimeInterface
            ? Carbon::instance($reference)->setTimezone(self::EVENT_TIMEZONE)
            : self::eventDateTimeFromStorage($reference);

        $comparisonPoint ??= self::nowInEventTimezone();

        return $eventStartsAt->lt($comparisonPoint) ? 'completed' : 'upcoming';
    }

    public function effectiveStatus(mixed $reference = null)
    {
        if ($this->status === 'cancelled') {
            return 'cancelled';
        }

        return self::automaticStatusFor($this->startsAtDate(), $reference);
    }

    protected static function eventDateTimeFromStorage(mixed $value)
    {
        if ($value === null || $value === '') {
            return null;
        }

        if ($value instanceof DateTimeInterface) {
            return Carbon::instance($value)->setTimezone(self::EVENT_TIMEZONE);
        }

        return Carbon::parse((string) $value, self::EVENT_TIMEZONE);
    }

    protected static function eventDateTimeForStorage(mixed $value)
    {
        if ($value === null || $value === '') {
            return null;
        }

        $dateTime = $value instanceof DateTimeInterface
            ? Carbon::instance($value)
            : Carbon::parse((string) $value, self::EVENT_TIMEZONE);

        return $dateTime
            ->setTimezone(self::EVENT_TIMEZONE)
            ->format('Y-m-d H:i:s');
    }
}
