<script setup>
import PublicHeaderIconButton from "./PublicHeaderIconButton.vue";

defineProps(["items", "compact"]);

defineEmits(["select"]);
</script>

<template>
    <div
        v-if="items.length"
        class="flex items-center gap-2"
        :class="compact ? 'gap-0.5' : ''"
    >
        <PublicHeaderIconButton
            v-for="item in items"
            :key="item.href"
            :icon-src="item.icon"
            :compact="compact"
            @click="$emit('select', item)"
        />
    </div>
</template>
