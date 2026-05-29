<script setup>
import { Head } from "@inertiajs/vue3";
import GameForm from "../../../Components/Admin/GameForm.vue";
import CMSLayout from "../../../Layouts/CMSLayout.vue";

defineOptions({ layout: CMSLayout });

defineProps(["tags", "difficultyOptions", "game"]);
</script>

<template>
    <Head title="Sukurti naują stalo žaidimą" />

    <GameForm
        page-title="Sukurti naują stalo žaidimą"
        submit-label="Pridėti"
        :tags="tags"
        :difficulty-options="difficultyOptions"
        :game="game"
    />
</template>
