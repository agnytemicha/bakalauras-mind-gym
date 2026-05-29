<script setup>
import CButton from "./UI/CButton.vue";

defineProps({
    title: {
        type: String,
        required: true,
    },
    items: {
        type: Array,
        required: true,
    },
    emptyTitle: {
        type: String,
        required: true,
    },
    emptyCopy: {
        type: String,
        required: true,
    },
    viewAllHref: {
        type: String,
        default: "",
    },
});
</script>

<template>
    <div>
        <div class="mb-6 flex flex-wrap items-end justify-between gap-4">
            <div>
                <p
                    class="font-display text-3xl uppercase leading-none text-black"
                >
                    {{ title }}
                </p>
            </div>

            <CButton v-if="viewAllHref" :href="viewAllHref" variant="secondary">
                Viską peržiūrėti
            </CButton>
        </div>

        <div
            v-if="items.length"
            class="grid gap-6 md:grid-cols-2 xl:grid-cols-3"
        >
            <slot />
        </div>

        <div v-else class="px-6 py-10 text-center">
            <p class="font-display text-3xl uppercase text-black">
                {{ emptyTitle }}
            </p>
            <p class="mt-4 text-sm leading-7 text-zinc-700">
                {{ emptyCopy }}
            </p>
        </div>
    </div>
</template>
