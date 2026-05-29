<script setup>
import checkIconSrc from "@icons/actions/check.svg";
import CFieldHelpTooltip from "./CFieldHelpTooltip.vue";

defineOptions({
    inheritAttrs: false,
});

const props = defineProps({
    modelValue: {
        type: [Array, Boolean, Number, String],
        default: false,
    },
    value: {
        type: [Boolean, Number, String],
        default: undefined,
    },
    label: {
        type: String,
        default: "",
    },
    caption: {
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
    disabled: {
        type: Boolean,
        default: false,
    },
});

const emit = defineEmits(["update:modelValue"]);

function isChecked() {
    if (Array.isArray(props.modelValue)) {
        return props.modelValue.includes(props.value);
    }

    return Boolean(props.modelValue);
}

function updateValue(event) {
    const checked = event.target.checked;

    if (Array.isArray(props.modelValue)) {
        const nextValue = props.modelValue.filter(
            (item) => item !== props.value,
        );

        if (checked) {
            nextValue.push(props.value);
        }

        emit("update:modelValue", nextValue);
        return;
    }

    emit("update:modelValue", checked);
}
</script>

<template>
    <div :class="wrapperClass">
        <div class="flex items-start gap-2">
            <label
                :for="id || undefined"
                :class="[
                    'group flex cursor-pointer items-start gap-3 py-1',
                    { 'cursor-not-allowed opacity-60': disabled },
                ]"
            >
                <input
                    :id="id || undefined"
                    :checked="isChecked()"
                    type="checkbox"
                    :value="value"
                    class="sr-only"
                    :disabled="disabled"
                    v-bind="$attrs"
                    @change="updateValue"
                />

                <span
                    :class="[
                        'mt-0.5 inline-flex h-5 w-5 shrink-0 items-center justify-center rounded-[0.45rem] border border-mg-border-gray bg-white text-black transition duration-150 group-hover:border-black group-focus-within:ring-2 group-focus-within:ring-black/10',
                        isChecked() ? 'border-black bg-white' : '',
                    ]"
                >
                    <img
                        v-if="isChecked()"
                        :src="checkIconSrc"
                        class="h-3 w-3 object-contain"
                        alt=""
                    />
                </span>

                <span class="min-w-0">
                    <span
                        v-if="label"
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

            <CFieldHelpTooltip v-if="hint" :text="hint" class="mt-0.5" />
        </div>
        <p
            v-if="error"
            class="mt-2 font-sans text-sm font-semibold text-red-600"
        >
            {{ error }}
        </p>
    </div>
</template>
