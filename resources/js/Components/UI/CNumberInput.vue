<script setup>
import CTextInput from "./CTextInput.vue";

defineOptions({
    inheritAttrs: false,
});

defineProps({
    modelValue: {
        type: [String, Number],
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
    variant: {
        type: String,
        default: "default",
    },
});

defineEmits(["update:modelValue"]);
</script>

<template>
    <CTextInput
        type="number"
        :model-value="modelValue"
        :label="label"
        :hint="hint"
        :error="error"
        :id="id"
        :wrapper-class="wrapperClass"
        :variant="variant"
        v-bind="$attrs"
        @update:model-value="$emit('update:modelValue', $event)"
    />
</template>
