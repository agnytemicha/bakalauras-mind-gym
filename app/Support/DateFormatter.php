<?php

namespace App\Support;

use DateTimeImmutable;
use DateTimeInterface;
use DateTimeZone;
use IntlDateFormatter;

final class DateFormatter
{
    private const LOCALE = 'lt_LT';

    private const DATE_PATTERN = "yyyy 'm.' MMMM d 'd.'";

    private const DATE_TIME_PATTERN = "yyyy 'm.' MMM d 'd.' HH:mm";

    private const SHORT_DATE_PATTERN = "MMMM d 'd.'";

    public static function date(?DateTimeInterface $date)
    {
        return self::format($date, self::DATE_PATTERN);
    }

    public static function dateTime(?DateTimeInterface $date)
    {
        return self::format($date, self::DATE_TIME_PATTERN);
    }

    public static function eventDateTime(?DateTimeInterface $date)
    {
        return self::dateTime($date);
    }

    public static function shortDate(?DateTimeInterface $date)
    {
        return self::format($date, self::SHORT_DATE_PATTERN);
    }

    public static function adminDateTime(?DateTimeInterface $date)
    {
        $date = self::dateInAppTimezone($date);

        if (! $date) {
            return '';
        }

        return $date->format('Y-m-d H:i');
    }

    private static function format(?DateTimeInterface $date, string $pattern)
    {
        $date = self::dateInAppTimezone($date);

        if (! $date) {
            return '';
        }

        $formatter = new IntlDateFormatter(
            self::LOCALE,
            IntlDateFormatter::NONE,
            IntlDateFormatter::NONE,
            self::timezone(),
            IntlDateFormatter::GREGORIAN,
            $pattern,
        );

        $formatted = $formatter->format($date);

        return $formatted === false ? '' : $formatted;
    }

    private static function dateInAppTimezone(?DateTimeInterface $date)
    {
        if (! $date) {
            return null;
        }

        return DateTimeImmutable::createFromInterface($date)
            ->setTimezone(new DateTimeZone(self::timezone()));
    }

    private static function timezone()
    {
        return (string) config('app.timezone', 'Europe/Vilnius');
    }
}
