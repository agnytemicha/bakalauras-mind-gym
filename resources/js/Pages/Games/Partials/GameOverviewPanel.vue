<script setup>
import CActionToggleButton from "../../../Components/UI/CActionToggleButton.vue";
import CRatingStars from "../../../Components/UI/CRatingStars.vue";
import heartFilledIconSrc from "@icons/actions/heart-filled.svg";
import heartIconSrc from "@icons/actions/heart.svg";
import documentIconSrc from "@icons/content/document.svg";
import ageIconSrc from "@icons/games/age.svg";
import difficultyIconSrc from "@icons/games/difficulty.svg";
import playerCountIconSrc from "@icons/games/players.svg";
import timeIconSrc from "@icons/games/time.svg";
import ownedGamesIconSrc from "@icons/profile/games.svg";
import wishlistIconSrc from "@icons/profile/wishlist.svg";

const { game, pendingActions } = defineProps(["game", "pendingActions"]);

const emit = defineEmits([
    "toggle-owned",
    "toggle-wishlist",
    "toggle-favorite",
]);
</script>

<template>
    <div class="space-y-6">
        <div class="min-w-0">
            <h1
                class="font-display text-[2.8rem] uppercase leading-none text-black sm:text-[3.375rem]"
            >
                {{ game.title }}
            </h1>

            <div class="mt-0 flex flex-wrap items-center gap-1.5">
                <p class="text-lg font-semibold leading-none text-zinc-700">
                    {{ game.reviewCountLabel }}
                </p>
                <CRatingStars
                    :rating="game.rating"
                    class="gap-1"
                    icon-class="h-5 w-5 object-contain"
                />
            </div>

            <div class="mt-4 flex flex-wrap gap-3">
                <span
                    class="inline-flex items-center gap-2 rounded-xl bg-mg-blue px-4 py-2 font-display text-base uppercase leading-none text-black shadow-md"
                >
                    <img
                        :src="playerCountIconSrc"
                        class="h-4 w-4 shrink-0 object-contain"
                    />
                    <span>{{ game.playersLabel }}</span>
                </span>
                <span
                    class="inline-flex items-center gap-2 rounded-xl bg-mg-blue px-4 py-2 font-display text-base uppercase leading-none text-black shadow-md"
                >
                    <img
                        :src="ageIconSrc"
                        class="h-4 w-4 shrink-0 object-contain"
                    />
                    <span>{{ game.ageRatingLabel }}</span>
                </span>
                <span
                    class="inline-flex items-center gap-2 rounded-xl bg-mg-blue px-4 py-2 font-display text-base uppercase leading-none text-black shadow-md"
                >
                    <img
                        :src="timeIconSrc"
                        class="h-4 w-4 shrink-0 object-contain"
                    />
                    <span>{{ game.durationLabel }}</span>
                </span>
                <span
                    class="inline-flex items-center gap-2 rounded-xl bg-mg-blue px-4 py-2 font-display text-base uppercase leading-none text-black shadow-md"
                >
                    <img
                        :src="difficultyIconSrc"
                        class="h-4 w-4 shrink-0 object-contain"
                    />
                    <span>{{ game.difficultyLabel }}</span>
                </span>
            </div>

            <p
                class="mt-4 font-sans text-base font-semibold leading-8 text-zinc-700"
            >
                {{ game.description }}
            </p>

            <div
                class="mt-4 flex flex-col items-start gap-3 lg:flex-row lg:items-center lg:gap-4"
            >
                <CActionToggleButton
                    label="Mano turimi žaidimai"
                    :icon-src="ownedGamesIconSrc"
                    :active="game.isOwned"
                    :disabled="pendingActions.owned"
                    @click="emit('toggle-owned')"
                />

                <CActionToggleButton
                    label="Norų sąrašas"
                    :icon-src="wishlistIconSrc"
                    :active="game.isWishlisted"
                    :disabled="pendingActions.wishlist"
                    @click="emit('toggle-wishlist')"
                />

                <CActionToggleButton
                    label="Mėgstamiausi žaidimai"
                    :icon-src="
                        game.isFavorite ? heartFilledIconSrc : heartIconSrc
                    "
                    :active="game.isFavorite"
                    :disabled="pendingActions.favorite"
                    @click="emit('toggle-favorite')"
                />
            </div>

            <div class="mt-8">
                <div
                    v-if="game.ruleBooks.length"
                    class="flex flex-col items-start"
                >
                    <div class="flex flex-col items-start gap-3">
                        <a
                            v-for="file in game.ruleBooks"
                            :key="file.url"
                            :href="file.url"
                            target="_blank"
                            rel="noreferrer"
                            class="inline-flex max-w-full w-fit self-start items-center gap-4 rounded-xl bg-mg-neutral px-4 py-3 font-sans text-lg font-semibold text-black shadow-md transition duration-200 hover:-translate-y-0.5"
                        >
                            <img
                                :src="documentIconSrc"
                                class="h-6 w-6 shrink-0 object-contain"
                            />
                            <span class="leading-tight">{{ file.name }}</span>
                        </a>
                    </div>

                    <p
                        class="mt-1 font-sans text-[10px] font-normal text-black"
                    >
                        *taisyklės paimtos iš interneto
                    </p>
                </div>

                <p v-else class="font-sans text-base italic text-black">
                    Taisyklių failų šiuo metu nėra
                </p>
            </div>
        </div>
    </div>
</template>
