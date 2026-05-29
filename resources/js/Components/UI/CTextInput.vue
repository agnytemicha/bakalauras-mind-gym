<script setup>
import { computed } from "vue";
import CFieldShell from "./CFieldShell.vue";

defineOptions({
    inheritAttrs: false,
});

const props = defineProps({
    modelValue: {
        type: [String, Number],
        default: "",
    },
    type: {
        type: String,
        default: "text",
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
    variant: {
        type: String,
        default: "default",
    },
});

const emit = defineEmits(["update:modelValue"]);

const inputClasses = computed(() => [
    "w-full rounded-2xl border border-mg-border-gray bg-white px-4 py-3 font-sans font-semibold outline-none transition placeholder:not-italic placeholder:text-mg-placeholder-gray disabled:cursor-not-allowed disabled:opacity-70",
    props.variant === "filter"
        ? "text-sm text-black shadow-md focus:border-mg-border-gray focus:ring-4 focus:ring-[rgba(0,0,0,0.05)]"
        : "text-base text-mg-field-gray shadow-none focus:border-black focus:ring-2 focus:ring-black/10",
]);
</script>

<template>
    <CFieldShell
        :id="id"
        :label="label"
        :hint="hint"
        :error="error"
        :wrapper-class="wrapperClass"
    >
        <input
            :id="id || undefined"
            :value="modelValue"
            :type="type"
            :class="inputClasses"
            v-bind="$attrs"
            @input="emit('update:modelValue', $event.target.value)"
        />
    </CFieldShell>
</template>
