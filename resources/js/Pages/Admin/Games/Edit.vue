<script setup>
import { Head } from "@inertiajs/vue3";
import GameForm from "../../../Components/Admin/GameForm.vue";
import CMSLayout from "../../../Layouts/CMSLayout.vue";

defineOptions({ layout: CMSLayout });

defineProps(["tags", "difficultyOptions", "game"]);
</script>

<template>
    <Head :title="`Redaguoti ${game.title}`" />

    <GameForm
        page-title="Redaguoti stalo žaidimą"
        submit-label="Išsaugoti"
        method="put"
        :tags="tags"
        :difficulty-options="difficultyOptions"
        :game="game"
    />
</template>
