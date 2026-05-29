<?php

namespace App\Enums;

use App\Enums\Concerns\HasSelectOptions;

enum GameDifficultyLevel: string
{
    use HasSelectOptions;

    case One = '1/5';
    case Two = '2/5';
    case Three = '3/5';
    case Four = '4/5';
    case Five = '5/5';

    public function label()
    {
        return $this->value;
    }
}
