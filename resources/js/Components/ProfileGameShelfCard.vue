<script setup>
import { Link, router } from "@inertiajs/vue3";
import { ref } from "vue";
import { route } from "ziggy-js";
import deleteIconSrc from "@icons/actions/delete.svg";
import ageIconSrc from "@icons/games/age.svg";
import difficultyIconSrc from "@icons/games/difficulty.svg";
import playerCountIconSrc from "@icons/games/players.svg";
import timeIconSrc from "@icons/games/time.svg";

defineOptions({
    name: "ProfileGameShelfCard",
});

const { game, shelfType } = defineProps(["game", "shelfType"]);

const isShelfPending = ref(false);

function shelfRouteName() {
    if (shelfType === "owned") {
        return "games.owned";
    }

    if (shelfType === "wishlist") {
        return "games.wishlist";
    }

    return "games.favorite";
}

function toggleShelf() {
    if (isShelfPending.value) {
        return;
    }

    isShelfPending.value = true;

    router.post(
        route(shelfRouteName(), game.slug, false),
        {},
        {
            preserveScroll: true,
            preserveState: true,
            onFinish: () => {
                isShelfPending.value = false;
            },
        },
    );
}
</script>

<template>
    <article
        class="relative grid min-h-[120px] grid-cols-[auto_minmax(0,1fr)] items-start gap-4 overflow-hidden rounded-3xl px-5 py-4 shadow-md"
        :class="
            shelfType === 'owned'
                ? 'bg-mg-blue'
                : shelfType === 'wishlist'
                  ? 'bg-mg-yellow'
                  : 'bg-mg-red'
        "
    >
        <Link
            :href="route('games.show', game.slug, false)"
            class="absolute inset-0 z-10 rounded-3xl"
        />

        <div class="absolute right-4 top-4 z-20">
            <button
                type="button"
                class="inline-flex h-10 w-10 items-center justify-center rounded-full transition duration-200 hover:-translate-y-0.5 disabled:cursor-not-allowed disabled:opacity-60"
                :disabled="isShelfPending"
                @click.stop="toggleShelf"
            >
                <img :src="deleteIconSrc" class="h-5 w-5 object-contain" />
            </button>
        </div>

        <div
            class="flex h-20 w-20 items-center justify-center self-start overflow-hidden rounded-3xl bg-white/55 shadow-md sm:h-24 sm:w-24"
        >
            <img
                v-if="game.coverImage"
                :src="game.coverImage"
                class="h-full w-full object-cover"
            />
            <div
                v-else
                class="flex h-full w-full items-center justify-center bg-[#f4f0e7] px-2 text-center"
            >
                <span
                    class="font-display text-sm uppercase leading-tight text-black"
                >
                    {{ game.title }}
                </span>
            </div>
        </div>

        <div class="min-w-0 self-start pr-12 sm:pr-16">
            <h3
                class="font-display text-[28px] uppercase leading-none text-black"
            >
                {{ game.title }}
            </h3>

            <div
                class="mt-4 flex flex-wrap items-center gap-x-4 gap-y-2 text-[15px] font-semibold leading-none text-zinc-800 sm:text-base"
            >
                <span class="inline-flex items-center gap-1.5">
                    <img
                        :src="playerCountIconSrc"
                        class="h-[18px] w-[18px] shrink-0 object-contain"
                    />
                    <span>{{ game.playersLabel }}</span>
                </span>
                <span class="inline-flex items-center gap-1.5">
                    <img
                        :src="ageIconSrc"
                        class="h-[18px] w-[18px] shrink-0 object-contain"
                    />
                    <span>{{ game.ageRatingLabel }}</span>
                </span>
                <span class="inline-flex items-center gap-1.5">
                    <img
                        :src="timeIconSrc"
                        class="h-[18px] w-[18px] shrink-0 object-contain"
                    />
                    <span>{{ game.durationLabel }}</span>
                </span>
                <span class="inline-flex items-center gap-1.5">
                    <img
                        :src="difficultyIconSrc"
                        class="h-[18px] w-[18px] shrink-0 object-contain"
                    />
                    <span>{{ game.difficultyLabel }}</span>
                </span>
            </div>
        </div>
    </article>
</template>
