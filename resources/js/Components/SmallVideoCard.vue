<script setup>
import authorIconSrc from "@icons/content/author.svg";

defineOptions({
    name: "SmallVideoCard",
});

defineProps(["video"]);
</script>

<template>
    <article class="h-full">
        <a
            :href="video.youtubeUrl"
            target="_blank"
            rel="noreferrer"
            class="flex h-full flex-col rounded-4xl bg-white p-5 shadow-md transition duration-200 hover:-translate-y-0.5"
        >
            <div class="overflow-hidden rounded-3xl">
                <img
                    v-if="video.thumbnailUrl"
                    :src="video.thumbnailUrl"
                    :alt="video.title"
                    class="aspect-video w-full object-cover"
                />
                <div
                    v-else
                    class="flex aspect-video items-center justify-center bg-mg-blue"
                >
                    <span
                        class="font-display text-3xl uppercase leading-none text-black"
                    >
                        YouTube
                    </span>
                </div>
            </div>

            <div class="mt-4 flex flex-1 flex-col">
                <h2
                    class="font-display text-3xl uppercase leading-none text-black"
                >
                    {{ video.title }}
                </h2>

                <div
                    class="mt-3 flex min-w-0 items-center justify-between gap-3"
                >
                    <div
                        class="flex min-w-0 items-center gap-2 font-sans text-base font-semibold text-mg-text-gray"
                    >
                        <img
                            :src="authorIconSrc"
                            class="h-5 w-5 shrink-0 object-contain"
                        />
                        <span class="truncate">{{ video.author }}</span>
                    </div>

                    <span
                        class="shrink-0 whitespace-nowrap font-sans text-sm font-semibold text-mg-border-gray"
                        >YouTube</span
                    >
                </div>
            </div>
        </a>
    </article>
</template>
