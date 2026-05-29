<script setup>
import CButton from "./UI/CButton.vue";

defineProps({
    title: {
        type: String,
        required: true,
    },
    href: {
        type: String,
        required: true,
    },
    linkLabel: {
        type: String,
        default: "Viską peržiūrėti",
    },
});
</script>

<template>
    <section class="section-shell">
        <div class="mb-6 flex flex-wrap items-end justify-between gap-4">
            <div>
                <p
                    class="font-display text-[2.4rem] uppercase leading-none text-black sm:text-5xl"
                >
                    {{ title }}
                </p>
            </div>
            <div
                class="hidden [@media(min-width:1024px)_and_(hover:hover)_and_(pointer:fine)]:block"
            >
                <CButton :href="href" variant="secondary">
                    {{ linkLabel }}
                </CButton>
            </div>
        </div>

        <slot />

        <div
            class="mt-6 flex justify-center [@media(min-width:1024px)_and_(hover:hover)_and_(pointer:fine)]:!hidden"
        >
            <CButton :href="href" variant="secondary">
                {{ linkLabel }}
            </CButton>
        </div>
    </section>
</template>
