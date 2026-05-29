<script setup>
import { route } from "ziggy-js";
import CButton from "../../../Components/UI/CButton.vue";
import noPhotoIconSrc from "@icons/content/no-photo.svg";
import spotlightAgeIconSrc from "@icons/games/age.svg";
import spotlightDifficultyIconSrc from "@icons/games/difficulty.svg";
import spotlightPlayerCountIconSrc from "@icons/games/players.svg";
import spotlightTimeIconSrc from "@icons/games/time.svg";

const { game } = defineProps(["game"]);
</script>

<template>
    <section v-if="game" class="section-shell mt-16">
        <p
            class="font-display text-[2.4rem] uppercase leading-none text-black sm:text-5xl"
        >
            Šio mėnesio top stalo žaidimas
        </p>

        <div
            class="mt-6 overflow-hidden rounded-4xl bg-mg-yellow p-4 shadow-md sm:p-5 lg:p-6"
        >
            <div
                class="grid gap-5 sm:grid-cols-[8.5rem_minmax(0,1fr)] sm:items-start lg:grid-cols-[11rem_minmax(0,1fr)] lg:items-stretch lg:gap-6"
            >
                <div class="flex items-start justify-center sm:justify-start">
                    <div
                        class="relative flex aspect-square w-full max-w-72 shrink-0 items-center justify-center overflow-hidden rounded-3xl shadow-md sm:h-34 sm:w-34 sm:rounded-3xl lg:h-44 lg:w-44"
                        :class="
                            game.coverImage ? 'bg-mg-yellow' : 'bg-mg-neutral'
                        "
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

                <div class="flex min-w-0 h-full flex-col">
                    <h2
                        class="font-display text-3xl uppercase leading-[0.92] text-black sm:text-4xl"
                    >
                        {{ game.title }}
                    </h2>
                    <p
                        class="mt-2 min-h-[4.05em] overflow-hidden font-sans text-base leading-[1.35] text-black [display:-webkit-box] [-webkit-box-orient:vertical] [-webkit-line-clamp:3] sm:mt-3 sm:min-h-[4.35em] sm:text-lg sm:leading-[1.45]"
                    >
                        {{ game.description }}
                    </p>

                    <div
                        class="mt-4 flex flex-col gap-4 lg:mt-5 lg:flex-row lg:items-center lg:justify-between"
                    >
                        <div
                            class="flex flex-wrap items-center gap-x-4 gap-y-3 sm:flex-nowrap lg:flex-1 lg:gap-x-5"
                        >
                            <div
                                class="flex items-center gap-2 font-sans text-base font-semibold leading-none text-black whitespace-nowrap sm:gap-2.5 sm:text-lg"
                            >
                                <img
                                    :src="spotlightPlayerCountIconSrc"
                                    class="h-6 w-6 shrink-0 object-contain"
                                />
                                <span>{{ game.playersLabel }}</span>
                            </div>
                            <div
                                class="flex items-center gap-2 font-sans text-base font-semibold leading-none text-black whitespace-nowrap sm:gap-2.5 sm:text-lg"
                            >
                                <img
                                    :src="spotlightTimeIconSrc"
                                    class="h-6 w-6 shrink-0 object-contain"
                                />
                                <span>{{ game.durationLabel }}</span>
                            </div>
                            <div
                                class="flex items-center gap-2 font-sans text-base font-semibold leading-none text-black whitespace-nowrap sm:gap-2.5 sm:text-lg"
                            >
                                <img
                                    :src="spotlightAgeIconSrc"
                                    class="h-6 w-6 shrink-0 object-contain"
                                />
                                <span>{{ game.ageRatingLabel }}</span>
                            </div>
                            <div
                                class="flex items-center gap-2 font-sans text-base font-semibold leading-none text-black whitespace-nowrap sm:gap-2.5 sm:text-lg"
                            >
                                <img
                                    :src="spotlightDifficultyIconSrc"
                                    class="h-6 w-6 shrink-0 object-contain"
                                />
                                <span>{{ game.difficultyLabel }}</span>
                            </div>
                        </div>

                        <div
                            class="flex flex-wrap justify-start gap-3 lg:shrink-0 lg:justify-end"
                        >
                            <CButton
                                :href="route('games.show', game.slug, false)"
                                variant="primary"
                            >
                                Peržiūrėti daugiau
                            </CButton>
                            <CButton href="/games" variant="secondary">
                                Visi žaidimai
                            </CButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>
