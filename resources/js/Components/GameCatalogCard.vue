<script setup>
import { Link, router, usePage } from "@inertiajs/vue3";
import { inject, ref } from "vue";
import { route } from "ziggy-js";
import CRatingStars from "./UI/CRatingStars.vue";
import heartFilledIconSrc from "@icons/actions/heart-filled.svg";
import heartIconSrc from "@icons/actions/heart.svg";
import ageIconSrc from "@icons/games/age.svg";
import difficultyIconSrc from "@icons/games/difficulty.svg";
import playerCountIconSrc from "@icons/games/players.svg";
import timeIconSrc from "@icons/games/time.svg";

defineOptions({
    name: "GameCatalogCard",
});

const { game } = defineProps(["game"]);

const page = usePage();
const openAuthModal = inject("openAuthModal", () => {});
const isFavoritePending = ref(false);

function toggleFavorite() {
    if (isFavoritePending.value) {
        return;
    }

    if (!page.props.auth.user) {
        openAuthModal("login");
        return;
    }

    isFavoritePending.value = true;

    router.post(
        route("games.favorite", game.slug, false),
        {},
        {
            preserveScroll: true,
            preserveState: true,
            onFinish: () => {
                isFavoritePending.value = false;
            },
        },
    );
}
</script>

<template>
    <article
        class="game-catalog-card relative flex h-full flex-col overflow-hidden rounded-4xl shadow-md"
    >
        <Link
            :href="route('games.show', game.slug, false)"
            class="absolute inset-0 z-10 rounded-4xl"
        />

        <div class="px-5 pt-6">
            <div
                class="-translate-y-2 overflow-hidden rounded-4xl shadow-md"
            >
                <img
                    v-if="game.coverImage"
                    :src="game.coverImage"
                    class="h-56 w-full object-cover"
                />
                <div
                    v-else
                    class="flex h-56 items-center justify-center bg-[#f4f0e7] px-6 text-center"
                >
                    <p
                        class="font-display text-[2rem] uppercase leading-none text-black"
                    >
                        {{ game.title }}
                    </p>
                </div>
            </div>
        </div>

        <div class="flex flex-1 flex-col px-5 pb-5 pt-2">
            <div v-if="game.tags.length" class="flex flex-wrap gap-2">
                <span
                    v-for="tag in game.tags"
                    :key="tag"
                    class="rounded-xl bg-white px-3.5 py-1.5 text-sm font-semibold leading-none text-[#274666]"
                >
                    {{ tag }}
                </span>
            </div>

            <div class="mt-4 flex items-start justify-between gap-3">
                <div class="min-w-0 flex-1">
                    <h3
                        class="font-display text-2xl uppercase leading-none text-black sm:text-[2.2rem]"
                    >
                        {{ game.title }}
                    </h3>
                </div>

                <button
                    type="button"
                    class="relative z-20 inline-flex h-10 w-10 shrink-0 items-center justify-center rounded-full transition duration-200 hover:-translate-y-0.5 disabled:cursor-not-allowed disabled:opacity-60"
                    :disabled="isFavoritePending"
                    @click="toggleFavorite"
                >
                    <img
                        :src="
                            game.isFavorite ? heartFilledIconSrc : heartIconSrc
                        "
                        class="h-7 w-7 object-contain"
                    />
                </button>
            </div>

            <p
                class="mt-3 overflow-hidden text-sm leading-7 text-zinc-700 [display:-webkit-box] [-webkit-box-orient:vertical] [-webkit-line-clamp:3]"
            >
                {{ game.description }}
            </p>

            <div
                class="mt-4 flex flex-wrap items-center gap-x-4 gap-y-3 text-base font-semibold leading-none text-zinc-700"
            >
                <span class="inline-flex items-center gap-1.5">
                    <img
                        :src="playerCountIconSrc"
                        class="h-4 w-4 shrink-0 object-contain"
                    />
                    <span>{{ game.playersLabel }}</span>
                </span>
                <span class="inline-flex items-center gap-1.5">
                    <img
                        :src="ageIconSrc"
                        class="h-4 w-4 shrink-0 object-contain"
                    />
                    <span>{{ game.ageRatingLabel }}</span>
                </span>
                <span class="inline-flex items-center gap-1.5">
                    <img
                        :src="timeIconSrc"
                        class="h-4 w-4 shrink-0 object-contain"
                    />
                    <span>{{ game.durationLabel }}</span>
                </span>
                <span class="inline-flex items-center gap-1.5">
                    <img
                        :src="difficultyIconSrc"
                        class="h-4 w-4 shrink-0 object-contain"
                    />
                    <span>{{ game.difficultyLabel }}</span>
                </span>
            </div>

            <div
                class="mt-auto flex items-center justify-between gap-3 pt-5 text-sm font-bold"
            >
                <CRatingStars
                    :rating="game.rating"
                    class="gap-1.5"
                    icon-class="h-6 w-6 object-contain"
                />

                <span class="text-zinc-700">{{ game.reviewCountLabel }}</span>
            </div>
        </div>
    </article>
</template>

<style scoped>
.game-catalog-card:nth-child(3n + 1) {
    background-color: var(--color-mg-blue);
}

.game-catalog-card:nth-child(3n + 2) {
    background-color: var(--color-mg-yellow);
}

.game-catalog-card:nth-child(3n) {
    background-color: var(--color-mg-red);
}
</style>
