<?php

namespace App\Support;

use App\Models\Article;
use App\Models\Event;
use App\Models\Game;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use InvalidArgumentException;

class MediaImageManager
{
    public const DISK = 'public';

    public function sync(Model $owner, array $uploadedImages, array $imageOrder, array $removedImageIds, bool $single = false)
    {
        $existingImages = $this->existingImagesByToken($owner, $removedImageIds);

        $this->deleteModels($existingImages['removed']);

        $imagesByToken = [
            ...$existingImages['kept'],
            ...$this->storeUploadedImages($owner, $uploadedImages),
        ];
        $finalImages = $this->orderedImages($imagesByToken, $imageOrder);
        $finalImages = $single ? $this->keepOnlyFirstImage($finalImages) : $finalImages;

        $this->saveImageOrder($finalImages);
    }

    protected function existingImagesByToken(Model $owner, array $removedImageIds)
    {
        $removedIds = $this->idList($removedImageIds);
        $keptImages = [];
        $removedImages = [];

        foreach ($owner->images()->get() as $image) {
            $imageId = (int) $image->id;

            if (in_array($imageId, $removedIds, true)) {
                $removedImages[] = $image;

                continue;
            }

            $keptImages["existing:{$imageId}"] = $image;
        }

        return [
            'kept' => $keptImages,
            'removed' => $removedImages,
        ];
    }

    protected function storeUploadedImages(Model $owner, array $uploadedImages)
    {
        $storedImages = [];

        foreach (array_values($uploadedImages) as $index => $file) {
            $storedImages["new:{$index}"] = $owner->images()->create(
                $this->storedImageAttributes($owner, $file),
            );
        }

        return $storedImages;
    }

    protected function orderedImages(array $imagesByToken, array $imageOrder)
    {
        $orderedImages = [];
        $usedTokens = [];

        foreach ($imageOrder as $token) {
            $token = trim((string) $token);

            if ($token === '' || isset($usedTokens[$token]) || ! isset($imagesByToken[$token])) {
                continue;
            }

            $orderedImages[] = $imagesByToken[$token];
            $usedTokens[$token] = true;
        }

        foreach ($imagesByToken as $token => $image) {
            if (! isset($usedTokens[$token])) {
                $orderedImages[] = $image;
            }
        }

        return $orderedImages;
    }

    protected function keepOnlyFirstImage(array $images)
    {
        if (count($images) <= 1) {
            return $images;
        }

        $this->deleteModels(array_slice($images, 1));

        return array_slice($images, 0, 1);
    }

    protected function saveImageOrder(array $images)
    {
        foreach ($images as $index => $image) {
            $image->forceFill([
                'sort_order' => $index + 1,
            ])->save();
        }
    }

    public function deleteAll(Model $owner)
    {
        $this->deleteModels($owner->images()->get());
    }

    public function adminImages(Model $owner)
    {
        $images = $owner->images()->get();
        $adminImages = [];

        foreach ($images as $image) {
            $url = $image->publicUrl();

            $adminImages[] = [
                'id' => $image->id,
                'token' => "existing:{$image->id}",
                'source' => 'existing',
                'name' => $image->original_name,
                'url' => $url,
                'previewUrl' => $url,
                'size' => $image->size,
                'sizeLabel' => $this->fileSizeLabel($image->size),
                'sortOrder' => $image->sort_order,
            ];
        }

        return $adminImages;
    }

    public function coverImageUrl(Model $owner)
    {
        $image = $owner->images()->first();

        return $image?->publicUrl();
    }

    protected function deleteModels($images)
    {
        if (count($images) === 0) {
            return;
        }

        foreach (collect($images)->groupBy('disk') as $disk => $diskImages) {
            $paths = $diskImages
                ->pluck('path')
                ->filter()
                ->values()
                ->all();

            Storage::disk($disk)->delete($paths);
        }

        foreach ($images as $image) {
            $image->delete();
        }
    }

    protected function idList(array $ids)
    {
        $cleanIds = [];

        foreach ($ids as $id) {
            $id = (int) $id;

            if ($id > 0 && ! in_array($id, $cleanIds, true)) {
                $cleanIds[] = $id;
            }
        }

        return $cleanIds;
    }

    protected function fileSizeLabel(int $size)
    {
        $kilobytes = max(1, (int) round($size / 1024));

        return "{$kilobytes} KB";
    }

    protected function storedImageAttributes(Model $owner, UploadedFile $file)
    {
        $hash = sha1(Str::uuid()->toString().$file->getClientOriginalName().microtime(true));
        $extension = strtolower($file->getClientOriginalExtension() ?: $file->guessExtension() ?: 'bin');
        $baseDirectory = "images/{$this->bucketDirectory($owner)}";
        $path = "{$baseDirectory}/".substr($hash, 0, 2).'/'.substr($hash, 2, 2)."/{$hash}.{$extension}";

        Storage::disk(self::DISK)->putFileAs(dirname($path), $file, basename($path));

        return [
            'disk' => self::DISK,
            'path' => $path,
            'original_name' => $file->getClientOriginalName(),
            'mime_type' => $file->getClientMimeType() ?: $file->getMimeType() ?: 'application/octet-stream',
            'size' => $file->getSize() ?: 0,
            'sort_order' => 9999,
        ];
    }

    protected function bucketDirectory(Model $owner)
    {
        if ($owner instanceof Game) {
            return 'games';
        }

        if ($owner instanceof Article) {
            return 'articles';
        }

        if ($owner instanceof Event) {
            return 'events';
        }

        throw new InvalidArgumentException('Unsupported image owner: '.$owner::class);
    }
}
