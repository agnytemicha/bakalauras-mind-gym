<script setup>
defineOptions({
    inheritAttrs: false,
});

const props = defineProps({
    modelValue: {
        type: [Boolean, Number, String],
        default: "",
    },
    value: {
        type: [Boolean, Number, String],
        required: true,
    },
    label: {
        type: String,
        required: true,
    },
    caption: {
        type: String,
        default: "",
    },
    id: {
        type: String,
        default: "",
    },
    name: {
        type: String,
        default: "",
    },
    disabled: {
        type: Boolean,
        default: false,
    },
});

const emit = defineEmits(["update:modelValue"]);

function updateValue() {
    if (props.disabled) {
        return;
    }

    emit("update:modelValue", props.value);
}
</script>

<template>
    <label
        :for="id || undefined"
        :class="[
            'group flex cursor-pointer items-start gap-3 py-1',
            { 'cursor-not-allowed opacity-60': disabled },
        ]"
    >
        <input
            :id="id || undefined"
            :checked="modelValue === value"
            type="radio"
            :name="name || undefined"
            :value="value"
            :disabled="disabled"
            class="sr-only"
            v-bind="$attrs"
            @change="updateValue"
        />

        <span
            :class="[
                'mt-0.5 inline-flex h-5 w-5 shrink-0 items-center justify-center rounded-full border border-mg-border-gray bg-white text-black transition duration-150 group-hover:border-black group-focus-within:ring-2 group-focus-within:ring-black/10',
                modelValue === value ? 'border-black bg-white' : '',
            ]"
        >
            <span
                v-if="modelValue === value"
                class="h-2.5 w-2.5 rounded-full bg-black"
            />
        </span>

        <span class="min-w-0">
            <span
                class="block font-sans text-base font-semibold leading-[1.25] text-black"
            >
                {{ label }}
            </span>
            <span
                v-if="caption"
                class="mt-1 block font-sans text-sm leading-5 text-mg-border-gray"
            >
                {{ caption }}
            </span>
        </span>
    </label>
</template>
