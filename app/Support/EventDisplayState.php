<?php

namespace App\Support;

class EventDisplayState
{
    public static function seatsLabel(int $availableSeats, int $seatsTotal)
    {
        return "{$availableSeats}/{$seatsTotal}";
    }

    public static function seatsState(int $availableSeats)
    {
        return $availableSeats > 0 ? 'available' : 'full';
    }

    public static function registrationAction(
        bool $isAuthenticated,
        bool $isRegistered,
        int $availableSeats,
        string $status,
    ) {
        if ($isRegistered && $status === 'upcoming') {
            return [
                'type' => 'cancel',
                'label' => 'Atšaukti registraciją',
                'variant' => 'secondary',
                'enabled' => true,
            ];
        }

        if ($status !== 'upcoming') {
            return [
                'type' => 'disabled',
                'label' => 'Registracija negalima',
                'variant' => 'secondary',
                'enabled' => false,
            ];
        }

        if ($availableSeats <= 0) {
            return [
                'type' => 'disabled',
                'label' => 'Vietų nebėra',
                'variant' => 'secondary',
                'enabled' => false,
            ];
        }

        if (! $isAuthenticated) {
            return [
                'type' => 'login',
                'label' => 'Patvirtinti registraciją',
                'variant' => 'danger',
                'enabled' => true,
            ];
        }

        return [
            'type' => 'register',
            'label' => 'Patvirtinti registraciją',
            'variant' => 'danger',
            'enabled' => true,
        ];
    }
}
