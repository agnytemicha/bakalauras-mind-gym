<script setup>
import HomeContentSection from "../../../Components/HomeContentSection.vue";
import HomeEventCard from "../../../Components/HomeEventCard.vue";

defineProps(["events"]);

defineEmits(["open"]);
</script>

<template>
    <HomeContentSection
        v-if="events.length"
        class="mt-16"
        title="Artimiausi renginiai"
        href="/events"
    >
        <div
            class="-mx-4 overflow-x-auto px-4 pb-4 sm:-mx-6 sm:px-6 lg:mx-0 lg:px-0 xl:overflow-visible"
        >
            <div
                class="flex min-w-max snap-x snap-mandatory items-stretch gap-4 xl:min-w-0 xl:w-full xl:justify-center"
            >
                <HomeEventCard
                    v-for="event in events"
                    :key="event.slug"
                    :event="event"
                    @open="$emit('open', $event)"
                />
            </div>
        </div>
    </HomeContentSection>
</template>
