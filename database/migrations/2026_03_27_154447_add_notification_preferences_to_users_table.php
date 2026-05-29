<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->boolean('wants_event_notifications')->default(false)->after('wants_newsletter');
            $table->boolean('wants_game_notifications')->default(false)->after('wants_event_notifications');
            $table->boolean('wants_learning_notifications')->default(false)->after('wants_game_notifications');
            $table->boolean('wants_event_reminders')->default(false)->after('wants_learning_notifications');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void {}
};
