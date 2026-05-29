<?php

namespace App\Support;

class YouTubeVideoSupport
{
    public static function thumbnailUrl(string $url)
    {
        $videoId = self::videoId($url);

        return $videoId ? "https://i.ytimg.com/vi/{$videoId}/hqdefault.jpg" : null;
    }

    public static function videoId(string $url)
    {
        if (preg_match('/youtube\.com\/watch\?v=([^\&\?\/]+)/', $url, $videoId)) {
            $values = $videoId[1];
        } elseif (preg_match('/youtube\.com\/embed\/([^\&\?\/]+)/', $url, $videoId)) {
            $values = $videoId[1];
        } elseif (preg_match('/youtube\.com\/v\/([^\&\?\/]+)/', $url, $videoId)) {
            $values = $videoId[1];
        } elseif (preg_match('/youtu\.be\/([^\&\?\/]+)/', $url, $videoId)) {
            $values = $videoId[1];
        } elseif (preg_match('/youtube\.com\/verify_age\?next_url=\/watch%3Fv%3D([^\&\?\/]+)/', $url, $id)) {
            $values = $videoId[1];
        }

        return $values ?? null;
    }
}
