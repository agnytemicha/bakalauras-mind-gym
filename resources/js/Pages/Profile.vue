<script setup>
import { Head } from "@inertiajs/vue3";
import PublicLayout from "../Layouts/PublicLayout.vue";
import ProfileDetailsSection from "./Profile/Partials/ProfileDetailsSection.vue";
import ProfileShortcutsSection from "./Profile/Partials/ProfileShortcutsSection.vue";

defineOptions({ layout: PublicLayout });

defineProps([
    "profile",
    "gameFilters",
    "gameShelves",
    "registeredEventSections",
]);
</script>

<template>
    <Head title="Profilis" />

    <ProfileDetailsSection :profile="profile" />

    <ProfileShortcutsSection
        :game-shelves="gameShelves"
        :game-filters="gameFilters"
        :registered-event-sections="registeredEventSections"
    />
</template>
