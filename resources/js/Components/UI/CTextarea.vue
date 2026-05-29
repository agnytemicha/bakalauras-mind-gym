<script setup>
import CFieldShell from "./CFieldShell.vue";

defineOptions({
    inheritAttrs: false,
});

defineProps({
    modelValue: {
        type: String,
        default: "",
    },
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

const emit = defineEmits(["update:modelValue"]);
</script>

<template>
    <CFieldShell
        :id="id"
        :label="label"
        :hint="hint"
        :error="error"
        :wrapper-class="wrapperClass"
    >
        <textarea
            :id="id || undefined"
            :value="modelValue"
            class="w-full resize-y rounded-2xl border border-mg-border-gray bg-white px-4 py-3 font-sans text-base font-semibold text-mg-field-gray shadow-none outline-none transition placeholder:not-italic placeholder:text-mg-placeholder-gray focus:border-black focus:ring-2 focus:ring-black/10 disabled:cursor-not-allowed disabled:opacity-70"
            v-bind="$attrs"
            @input="emit('update:modelValue', $event.target.value)"
        />
    </CFieldShell>
</template>
