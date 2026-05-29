<?php

namespace App\Models;

use App\Enums\GameDifficultyLevel;
use App\Models\Concerns\HasMediaImages;
use Illuminate\Database\Eloquent\Model;

class Game extends Model
{
    use HasMediaImages;

    protected $fillable = [
        'title',
        'slug',
        'description',
        'min_players',
        'max_players',
        'age_rating',
        'duration_minutes',
        'difficulty',
        'rating',
        'featured',
        'play_tips_blocks',
        'video_blocks',
        'rules',
        'rulebook_files',
    ];

    protected function casts()
    {
        return [
            'featured' => 'boolean',
            'rating' => 'decimal:2',
            'play_tips_blocks' => 'array',
            'video_blocks' => 'array',
            'rulebook_files' => 'array',
        ];
    }

    public static function cleanPlayTipBlocks(?array $blocks)
    {
        $cleanBlocks = [];

        foreach ($blocks ?? [] as $block) {
            if (! is_array($block)) {
                continue;
            }

            $cleanBlock = [
                'title' => trim((string) ($block['title'] ?? '')),
                'body' => trim((string) ($block['body'] ?? '')),
            ];

            if ($cleanBlock['title'] !== '' && $cleanBlock['body'] !== '') {
                $cleanBlocks[] = $cleanBlock;
            }
        }

        return $cleanBlocks;
    }

    public function resolvedPlayTipBlocks()
    {
        return self::cleanPlayTipBlocks($this->play_tips_blocks);
    }

    public static function cleanVideoBlocks(?array $blocks)
    {
        $cleanBlocks = [];

        foreach ($blocks ?? [] as $block) {
            if (! is_array($block)) {
                continue;
            }

            $title = trim((string) ($block['title'] ?? ''));
            $author = trim((string) ($block['author'] ?? ''));
            $youtubeUrl = trim((string) ($block['youtube_url'] ?? ''));

            if ($title !== '' && $author !== '' && $youtubeUrl !== '') {
                $cleanBlocks[] = [
                    'title' => $title,
                    'author' => $author,
                    'youtube_url' => $youtubeUrl,
                ];
            }

            if (count($cleanBlocks) === 3) {
                break;
            }
        }

        return $cleanBlocks;
    }

    public function resolvedVideoBlocks()
    {
        return self::cleanVideoBlocks($this->video_blocks);
    }

    public static function difficultyValue(?string $value)
    {
        $trimmed = trim((string) $value);
        $difficulty = GameDifficultyLevel::tryFrom($trimmed);

        return $difficulty?->value ?? GameDifficultyLevel::Three->value;
    }

    public static function difficultySearchValues(?string $value)
    {
        $trimmed = trim((string) $value);

        if ($trimmed === '') {
            return [];
        }

        $difficulty = GameDifficultyLevel::tryFrom($trimmed);

        return $difficulty ? [$difficulty->value] : [];
    }

    public function displayDifficulty()
    {
        return self::difficultyValue((string) $this->getRawOriginal('difficulty'));
    }

    public function playersLabel()
    {
        if ($this->min_players === $this->max_players) {
            return (string) $this->min_players;
        }

        return "{$this->min_players}-{$this->max_players}";
    }

    public function playersCountLabel()
    {
        return "{$this->playersLabel()} žaidėjai";
    }

    public function ageRatingLabel()
    {
        return "{$this->age_rating}+";
    }

    public function durationLabel()
    {
        return "{$this->duration_minutes} min";
    }

    public function difficultyLabel()
    {
        return $this->displayDifficulty();
    }

    public function tags()
    {
        return $this->belongsToMany(GameTag::class, 'game_tag')->withTimestamps();
    }

    public function favoritedBy()
    {
        return $this->belongsToMany(User::class, 'favorite_games')->withTimestamps();
    }

    public function ownedBy()
    {
        return $this->belongsToMany(User::class, 'owned_games')->withTimestamps();
    }

    public function wishlistedBy()
    {
        return $this->belongsToMany(User::class, 'wishlist_games')->withTimestamps();
    }

    public function reviews()
    {
        return $this->hasMany(GameReview::class);
    }

    public function refreshRating()
    {
        $average = $this->reviews()->avg('rating') ?? 0;

        $this->forceFill([
            'rating' => round((float) $average, 2),
        ])->save();
    }
}
