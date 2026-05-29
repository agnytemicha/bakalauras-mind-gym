<script setup>
import { Head } from "@inertiajs/vue3";
import { ref } from "vue";
import EventRegistrationModal from "../Components/EventRegistrationModal.vue";
import PublicLayout from "../Layouts/PublicLayout.vue";
import HomeCommunitySection from "./Home/Partials/HomeCommunitySection.vue";
import HomeHeroSection from "./Home/Partials/HomeHeroSection.vue";
import HomeLatestArticlesSection from "./Home/Partials/HomeLatestArticlesSection.vue";
import HomeLatestGamesSection from "./Home/Partials/HomeLatestGamesSection.vue";
import HomeLearningSection from "./Home/Partials/HomeLearningSection.vue";
import HomeSpotlightGameSection from "./Home/Partials/HomeSpotlightGameSection.vue";
import HomeUpcomingEventsSection from "./Home/Partials/HomeUpcomingEventsSection.vue";

defineOptions({ layout: PublicLayout });

defineProps([
    "stats",
    "latestGames",
    "latestArticles",
    "topGame",
    "upcomingEvents",
]);

const selectedEvent = ref(null);

function openEvent(event) {
    selectedEvent.value = event;
}

function closeEvent() {
    selectedEvent.value = null;
}
</script>

<template>
    <Head title="Pradžia" />

    <HomeHeroSection />

    <HomeLatestGamesSection :games="latestGames" />

    <HomeUpcomingEventsSection :events="upcomingEvents" @open="openEvent" />

    <HomeLearningSection />

    <HomeLatestArticlesSection :articles="latestArticles" />

    <HomeCommunitySection :stats="stats" />

    <HomeSpotlightGameSection :game="topGame" />

    <EventRegistrationModal
        v-if="selectedEvent"
        :event="selectedEvent"
        @close="closeEvent"
    />
</template>
