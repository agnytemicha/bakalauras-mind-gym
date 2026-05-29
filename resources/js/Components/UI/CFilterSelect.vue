<script setup>
import CFieldShell from "./CFieldShell.vue";

defineProps({
    id: {
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
    modelValue: {
        type: [String, Number],
        default: "",
    },
    options: {
        type: Array,
        required: true,
    },
    placeholder: {
        type: String,
        required: true,
    },
    includePlaceholderOption: {
        type: Boolean,
        default: true,
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
        <select
            :id="id || undefined"
            :value="modelValue"
            class="w-full rounded-2xl border border-mg-border-gray bg-white px-4 py-3 font-sans text-sm font-semibold text-black shadow-md transition focus:border-mg-border-gray focus:outline-none focus:ring-4 focus:ring-[rgba(0,0,0,0.05)]"
            @change="emit('update:modelValue', $event.target.value)"
        >
            <option v-if="includePlaceholderOption" value="">
                {{ placeholder }}
            </option>
            <option
                v-for="option in options"
                :key="option.value"
                :value="option.value"
            >
                {{ option.label }}
            </option>
        </select>
    </CFieldShell>
</template>
