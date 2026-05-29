<script setup>
import CFieldShell from "./CFieldShell.vue";

const props = defineProps({
    label: {
        type: String,
        default: "",
    },
    id: {
        type: String,
        default: "",
    },
    idPrefix: {
        type: String,
        default: "",
    },
    dateValue: {
        type: String,
        default: "",
    },
    timeValue: {
        type: String,
        default: "",
    },
    error: {
        type: String,
        default: "",
    },
    wrapperClass: {
        type: String,
        default: "",
    },
    hint: {
        type: String,
        default: "",
    },
    datePlaceholder: {
        type: String,
        default: "DD/MM/YYYY",
    },
    timePlaceholder: {
        type: String,
        default: "HH:mm",
    },
    disabled: {
        type: Boolean,
        default: false,
    },
});

const emit = defineEmits(["update:dateValue", "update:timeValue"]);

function fieldId(part) {
    const prefix = props.idPrefix || props.id;

    return prefix ? `${prefix}-${part}` : undefined;
}

function handleTimeInput(event) {
    if (props.disabled) {
        return;
    }

    emit("update:timeValue", formatTimeInput(event.target.value));
}

function handleDateInput(event) {
    if (props.disabled) {
        return;
    }

    emit("update:dateValue", formatDateInput(event.target.value));
}

function formatDateInput(value) {
    const digits = value.replace(/\D/g, "").slice(0, 8);

    if (digits.length <= 2) {
        return digits;
    }

    if (digits.length <= 4) {
        return `${digits.slice(0, 2)}/${digits.slice(2)}`;
    }

    return `${digits.slice(0, 2)}/${digits.slice(2, 4)}/${digits.slice(4)}`;
}

function formatTimeInput(value) {
    const digits = value.replace(/\D/g, "").slice(0, 4);

    if (digits.length <= 2) {
        return digits;
    }

    return `${digits.slice(0, 2)}:${digits.slice(2)}`;
}
</script>

<template>
    <CFieldShell
        :id="fieldId('date')"
        :label="label"
        :error="error"
        :hint="hint"
        :wrapper-class="wrapperClass"
    >
        <div class="grid gap-3 sm:grid-cols-[minmax(0,1fr)_7rem]">
            <input
                :id="fieldId('date')"
                :value="dateValue"
                type="text"
                inputmode="numeric"
                maxlength="10"
                :placeholder="datePlaceholder"
                class="w-full rounded-2xl border border-mg-border-gray bg-white px-4 py-3 font-sans text-base font-semibold text-mg-field-gray shadow-none outline-none transition placeholder:not-italic placeholder:text-mg-placeholder-gray focus:border-black focus:ring-2 focus:ring-black/10 disabled:cursor-not-allowed disabled:opacity-70"
                :disabled="disabled"
                @input="handleDateInput"
            />
            <input
                :id="fieldId('time')"
                :value="timeValue"
                type="text"
                inputmode="numeric"
                maxlength="5"
                :placeholder="timePlaceholder"
                class="w-full rounded-2xl border border-mg-border-gray bg-white px-4 py-3 text-center font-sans text-base font-semibold tracking-[0.08em] text-mg-field-gray shadow-none outline-none transition placeholder:not-italic placeholder:text-mg-placeholder-gray focus:border-black focus:ring-2 focus:ring-black/10 disabled:cursor-not-allowed disabled:opacity-70"
                :disabled="disabled"
                @input="handleTimeInput"
            />
        </div>
    </CFieldShell>
</template>
