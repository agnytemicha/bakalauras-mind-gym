<script setup>
import PublicHeaderNavLinks from "./PublicHeaderNavLinks.vue";

defineProps(["open", "items"]);

defineEmits(["select"]);
</script>

<template>
    <div v-if="open" class="xl:hidden">
        <PublicHeaderNavLinks
            class="mt-4 grid gap-2 rounded-3xl bg-white/95 p-3 shadow-md"
            :items="items"
            full-width
            @select="$emit('select')"
        />
    </div>
</template>
