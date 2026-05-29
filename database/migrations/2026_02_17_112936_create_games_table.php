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
        Schema::create('games', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('slug')->unique();
            $table->longText('description');
            $table->unsignedTinyInteger('min_players');
            $table->unsignedTinyInteger('max_players');
            $table->unsignedTinyInteger('age_rating');
            $table->unsignedSmallInteger('duration_minutes')->nullable();
            $table->string('difficulty');
            $table->decimal('rating', 3, 2)->default(0);
            $table->boolean('featured')->default(false);
            $table->longText('rules')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('games');
    }
};
