<script setup>
import GameCatalogCard from "../../../Components/GameCatalogCard.vue";
import CButton from "../../../Components/UI/CButton.vue";

defineProps(["games"]);
</script>

<template>
    <section class="section-shell mt-12">
        <div class="mb-6 flex items-end justify-between gap-4">
            <p class="font-display text-3xl uppercase text-black">
                Gal dar patiks
            </p>
            <CButton href="/games" variant="secondary">
                Grįžti į sąrašą
            </CButton>
        </div>

        <div class="grid gap-6 md:grid-cols-2 xl:grid-cols-3">
            <GameCatalogCard
                v-for="game in games"
                :key="game.slug"
                :game="game"
            />
        </div>
    </section>
</template>
