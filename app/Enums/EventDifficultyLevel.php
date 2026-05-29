<?php

namespace App\Enums;

use App\Enums\Concerns\HasSelectOptions;

enum EventDifficultyLevel: string
{
    use HasSelectOptions;

    case Beginner = 'beginner';
    case Intermediate = 'intermediate';
    case Advanced = 'advanced';
    case Everyone = 'everyone';

    public function label()
    {
        return match ($this) {
            self::Beginner => 'Pradedantiesiems',
            self::Intermediate => 'Vidutiniškai',
            self::Advanced => 'Patyrusiems',
            self::Everyone => 'Visiems',
        };
    }
}
