<script setup>
import { Link } from "@inertiajs/vue3";
import { route } from "ziggy-js";
import noPhotoIconSrc from "@icons/content/no-photo.svg";
import ageIconSrc from "@icons/games/age.svg";
import difficultyIconSrc from "@icons/games/difficulty.svg";
import playerCountIconSrc from "@icons/games/players.svg";
import timeIconSrc from "@icons/games/time.svg";

const { game, index } = defineProps(["game", "index"]);
</script>

<template>
    <article
        class="flex w-60.5 shrink-0 snap-start flex-col overflow-hidden rounded-4xl shadow-md sm:w-61.5 lg:w-56.5 xl:w-57.5"
        :class="['bg-mg-blue', 'bg-mg-yellow', 'bg-mg-red'][index % 3]"
    >
        <Link
            :href="route('games.show', game.slug, false)"
            class="flex h-full flex-col items-center px-4 py-4 text-center sm:px-5 sm:py-5"
        >
            <div class="flex w-full justify-center">
                <div
                    class="flex aspect-square w-full max-w-43 items-center justify-center overflow-hidden rounded-3xl shadow-md sm:max-w-44 lg:max-w-39 xl:max-w-40"
                    :class="{ 'bg-mg-neutral': !game.coverImage }"
                >
                    <img
                        v-if="game.coverImage"
                        :src="game.coverImage"
                        class="h-full w-full object-cover"
                    />
                    <img
                        v-else
                        :src="noPhotoIconSrc"
                        class="h-16 w-16 object-contain opacity-90 sm:h-20 sm:w-20"
                    />
                </div>
            </div>

            <div
                class="mt-4 flex w-full flex-1 flex-col items-center text-center"
            >
                <h2
                    class="w-full font-display text-[1.55rem] uppercase leading-[0.94] text-black sm:text-[1.7rem]"
                >
                    {{ game.title }}
                </h2>

                <div
                    class="mx-auto mt-4 grid w-fit max-w-full grid-cols-[max-content_max-content] justify-center gap-x-8 gap-y-2"
                >
                    <span
                        class="grid grid-cols-[1rem_auto] items-center gap-1.5 text-left font-sans text-[0.95rem] font-bold uppercase tracking-[0.08em] text-black"
                    >
                        <img
                            :src="playerCountIconSrc"
                            class="h-4 w-4 object-contain"
                        />
                        <span class="whitespace-nowrap">{{
                            game.playersLabel
                        }}</span>
                    </span>
                    <span
                        class="grid grid-cols-[1rem_auto] items-center gap-1.5 text-left font-sans text-[0.95rem] font-bold uppercase tracking-[0.08em] text-black"
                    >
                        <img
                            :src="ageIconSrc"
                            class="h-4 w-4 object-contain"
                        />
                        <span class="whitespace-nowrap">{{
                            game.ageRatingLabel
                        }}</span>
                    </span>
                    <span
                        class="grid grid-cols-[1rem_auto] items-center gap-1.5 text-left font-sans text-[0.95rem] font-bold uppercase tracking-[0.08em] text-black"
                    >
                        <img
                            :src="timeIconSrc"
                            class="h-4 w-4 object-contain"
                        />
                        <span class="whitespace-nowrap normal-case">{{
                            game.durationLabel
                        }}</span>
                    </span>
                    <span
                        class="grid grid-cols-[1rem_auto] items-center gap-1.5 text-left font-sans text-[0.95rem] font-bold uppercase tracking-[0.08em] text-black"
                    >
                        <img
                            :src="difficultyIconSrc"
                            class="h-4 w-4 object-contain"
                        />
                        <span class="whitespace-nowrap">{{
                            game.difficultyLabel
                        }}</span>
                    </span>
                </div>
            </div>
        </Link>
    </article>
</template>
