<?php

namespace App\Enums\Concerns;

trait HasSelectOptions
{
    public static function values()
    {
        $values = [];

        foreach (self::cases() as $case) {
            $values[] = $case->value;
        }

        return $values;
    }

    public static function options()
    {
        $options = [];

        foreach (self::cases() as $case) {
            $options[] = [
                'value' => $case->value,
                'label' => $case->label(),
            ];
        }

        return $options;
    }

    public static function labelFor(string $value)
    {
        return self::from($value)->label();
    }
}
