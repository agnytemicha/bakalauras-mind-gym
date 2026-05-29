<?php

namespace Database\Seeders;

use App\Models\CmsUser;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        CmsUser::query()->updateOrCreate(
            ['email' => 'admin@mindgym.lt'],
            [
                'name' => 'admin',
                'role' => 'admin',
                'password' => Hash::make('password'),
            ],
        );
    }
}
