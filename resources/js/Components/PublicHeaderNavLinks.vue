<script setup>
import { usePage } from "@inertiajs/vue3";
import CNavButton from "./UI/CNavButton.vue";

defineProps(["items", "fullWidth"]);

defineEmits(["select"]);

const page = usePage();

function isActive(item) {
    const currentPath = page.url.split("?")[0] || "/";
    const activeStartsWith = item.activeStartsWith ?? item.href;

    return (
        !item.href.includes("#") &&
        (currentPath === item.href ||
            currentPath === activeStartsWith ||
            (activeStartsWith !== "/" &&
                currentPath.startsWith(`${activeStartsWith}/`)))
    );
}
</script>

<template>
    <nav>
        <CNavButton
            v-for="item in items"
            :key="item.href"
            :href="item.href"
            tone="yellow"
            :active="isActive(item)"
            :full-width="fullWidth"
            @click="$emit('select')"
        >
            {{ item.label }}
        </CNavButton>
    </nav>
</template>
