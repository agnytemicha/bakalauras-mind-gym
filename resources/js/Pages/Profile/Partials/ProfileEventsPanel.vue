<script setup>
import ProfileEventRegistrationCard from "../../../Components/ProfileEventRegistrationCard.vue";

defineProps(["registeredEventSections"]);

defineEmits(["open-event"]);
</script>

<template>
    <div>
        <div v-if="registeredEventSections.length" class="space-y-6">
            <section
                v-for="section in registeredEventSections"
                :key="section.key"
                class="space-y-3"
            >
                <p class="font-display text-lg leading-none text-black">
                    {{ section.title }}
                </p>

                <div class="space-y-4">
                    <ProfileEventRegistrationCard
                        v-for="event in section.events"
                        :key="event.id"
                        :event="event"
                        @open="$emit('open-event', $event)"
                    />
                </div>
            </section>
        </div>
        <p
            v-else
            class="flex min-h-64 items-center justify-center px-6 text-center font-sans text-xl font-semibold italic leading-tight text-black"
        >
            Renginiuose nedalyvauji
        </p>
    </div>
</template>
