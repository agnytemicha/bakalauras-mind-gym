<script setup>
import { Head } from "@inertiajs/vue3";
import EventForm from "../../../Components/Admin/EventForm.vue";
import CMSLayout from "../../../Layouts/CMSLayout.vue";

defineOptions({ layout: CMSLayout });

defineProps(["difficultyOptions", "priceOptions", "event"]);
</script>

<template>
    <Head :title="`Redaguoti ${event.title}`" />

    <EventForm
        :difficulty-options="difficultyOptions"
        :price-options="priceOptions"
        :event="event"
    />
</template>
