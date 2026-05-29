<script setup>
import CarouselArrowButton from "../../../Components/CarouselArrowButton.vue";

const { game, images, activeImageIndex } = defineProps([
    "game",
    "images",
    "activeImageIndex",
]);

const emit = defineEmits([
    "show-image",
    "previous-image",
    "next-image",
    "open-lightbox",
]);
</script>

<template>
    <div class="w-full max-w-[560px] justify-self-center">
        <div class="relative">
            <CarouselArrowButton
                v-if="images.length > 1"
                direction="previous"
                class="absolute left-4 top-1/2 z-10 -translate-y-1/2"
                @click="emit('previous-image')"
            />

            <CarouselArrowButton
                v-if="images.length > 1"
                direction="next"
                class="absolute right-4 top-1/2 z-10 -translate-y-1/2"
                @click="emit('next-image')"
            />

            <div
                class="relative overflow-hidden rounded-4xl shadow-md"
            >
                <div
                    v-if="game.tags.length"
                    class="pointer-events-none absolute left-4 top-4 z-10 flex max-w-[calc(100%-2rem)] flex-wrap gap-2 sm:left-5 sm:top-5 sm:max-w-[calc(100%-2.5rem)]"
                >
                    <span
                        v-for="tag in game.tags"
                        :key="tag"
                        class="inline-flex items-center rounded-[0.32rem] bg-mg-red px-3 py-2 font-display text-lg uppercase leading-none text-black shadow-md"
                    >
                        {{ tag }}
                    </span>
                </div>

                <div v-if="images.length" class="h-72 sm:h-88 lg:h-100">
                    <button
                        type="button"
                        class="h-full w-full cursor-zoom-in"
                        @click="emit('open-lightbox', activeImageIndex)"
                    >
                        <img
                            :src="images[activeImageIndex].url"
                            class="h-full w-full object-cover"
                        />
                    </button>
                </div>

                <div
                    v-else
                    class="flex h-72 items-center justify-center px-6 text-center sm:h-88 lg:h-100"
                >
                    <p
                        class="font-display text-5xl uppercase leading-none text-black sm:text-[4rem]"
                    >
                        {{ game.title }}
                    </p>
                </div>
            </div>
        </div>

        <div v-if="images.length" class="mt-4">
            <div class="grid grid-cols-4 gap-3 sm:grid-cols-5">
                <button
                    v-for="(image, index) in images"
                    :key="`${image.id}-thumbnail`"
                    type="button"
                    class="group overflow-hidden rounded-2xl bg-zinc-100 shadow-md transition duration-300"
                    :class="[
                        index === activeImageIndex
                            ? 'opacity-100'
                            : 'opacity-40 hover:opacity-70',
                    ]"
                    @click="emit('show-image', index)"
                >
                    <img
                        :src="image.url"
                        class="h-20 w-full object-cover sm:h-24"
                    />
                </button>
            </div>
        </div>
    </div>
</template>
