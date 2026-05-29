<script setup>
import CFieldHelpTooltip from "./CFieldHelpTooltip.vue";

defineProps({
    label: {
        type: String,
        default: "",
    },
    hint: {
        type: String,
        default: "",
    },
    error: {
        type: String,
        default: "",
    },
    id: {
        type: String,
        default: "",
    },
    wrapperClass: {
        type: String,
        default: "",
    },
});
</script>

<template>
    <div :class="wrapperClass">
        <div v-if="label" class="mb-2 flex items-center gap-2">
            <label
                :for="id || undefined"
                class="block font-sans text-lg font-semibold leading-none text-black"
            >
                {{ label }}
            </label>
            <CFieldHelpTooltip v-if="hint" :text="hint" />
        </div>
        <div v-else-if="hint" class="mb-2 flex justify-end">
            <CFieldHelpTooltip :text="hint" />
        </div>
        <slot />
        <p v-if="error" class="mt-2 text-sm font-semibold text-mg-red">
            {{ error }}
        </p>
    </div>
</template>
