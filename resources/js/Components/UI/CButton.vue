<script setup>
import { Link } from "@inertiajs/vue3";

const buttonVariantClasses = {
    primary: "bg-mg-blue hover:bg-mg-soft-blue",
    danger: "bg-mg-red hover:bg-mg-soft-red",
    accent: "bg-mg-yellow hover:bg-mg-soft-yellow",
    secondary: "bg-mg-neutral hover:bg-mg-neutral-hover",
    outline:
        "border border-mg-neutral bg-white text-mg-text-gray hover:bg-[#f2f2f2]",
};

const props = defineProps({
    href: {
        type: String,
        default: "",
    },
    variant: {
        type: String,
        default: "primary",
    },
    block: {
        type: Boolean,
        default: false,
    },
    disabled: {
        type: Boolean,
        default: false,
    },
    loading: {
        type: Boolean,
        default: false,
    },
    loadingLabel: {
        type: String,
        default: "",
    },
    type: {
        type: String,
        default: "button",
    },
});

function handleClick(event) {
    if (props.disabled || props.loading) {
        event.preventDefault();
        event.stopPropagation();
    }
}

function buttonTag() {
    if (!props.href) {
        return "button";
    }

    if (
        props.href.startsWith("http") ||
        props.href.startsWith("mailto:") ||
        props.href.startsWith("tel:") ||
        props.href.includes("#")
    ) {
        return "a";
    }

    return Link;
}
</script>

<template>
    <component
        :is="buttonTag()"
        :href="href || undefined"
        :type="href ? undefined : type"
        :disabled="href ? undefined : disabled || loading"
        class="inline-flex items-center justify-center rounded-xl px-5 py-3 font-sans text-lg font-semibold text-black shadow-md transition duration-200 hover:-translate-y-0.5 disabled:cursor-not-allowed disabled:opacity-70"
        :class="[
            buttonVariantClasses[variant] ?? buttonVariantClasses.primary,
            {
                'w-full': block,
                'pointer-events-none opacity-70': (disabled || loading) && href,
            },
        ]"
        @click="handleClick"
    >
        <template v-if="loading && loadingLabel">
            {{ loadingLabel }}
        </template>
        <slot v-else />
    </component>
</template>
