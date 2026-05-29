<?php

namespace App\Enums;

use App\Enums\Concerns\HasSelectOptions;

enum EventPriceType: string
{
    use HasSelectOptions;

    case Free = 'free';
    case Paid = 'paid';

    public function label()
    {
        return match ($this) {
            self::Free => 'Nemokami',
            self::Paid => 'Mokami',
        };
    }
}
