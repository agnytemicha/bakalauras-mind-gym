<script setup>
import HomeContentSection from "../../../Components/HomeContentSection.vue";
import GameCarouselCard from "../../../Components/GameCarouselCard.vue";

defineProps(["games"]);
</script>

<template>
    <HomeContentSection
        v-if="games.length"
        class="mt-12"
        title="Naujausi žaidimai"
        href="/games"
    >
        <div
            class="-mx-4 overflow-x-auto px-4 pb-4 sm:-mx-6 sm:px-6 lg:mx-0 lg:px-0 xl:overflow-visible"
        >
            <div
                class="flex min-w-max snap-x snap-mandatory items-stretch gap-4 xl:min-w-0 xl:w-full"
            >
                <GameCarouselCard
                    v-for="(game, index) in games"
                    :key="game.slug"
                    :game="game"
                    :index="index"
                />
            </div>
        </div>
    </HomeContentSection>
</template>
