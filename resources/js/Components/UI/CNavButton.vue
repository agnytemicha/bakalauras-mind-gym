<script setup>
import { Link } from "@inertiajs/vue3";

const props = defineProps({
    href: {
        type: String,
        required: true,
    },
    tone: {
        type: String,
        default: "yellow",
    },
    active: {
        type: Boolean,
        default: false,
    },
    fullWidth: {
        type: Boolean,
        default: false,
    },
});

function toneClass(tone) {
    if (tone === "red") {
        return "bg-mg-red hover:bg-mg-soft-red";
    }

    if (tone === "blue") {
        return "bg-mg-blue hover:bg-mg-soft-blue";
    }

    if (tone === "white") {
        return "bg-white hover:bg-[#f6efe1]";
    }

    if (tone === "gray") {
        return "bg-mg-neutral hover:bg-mg-neutral-hover";
    }

    return "bg-mg-yellow hover:bg-mg-soft-yellow";
}

function buttonTag() {
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
        :href="href"
        class="inline-flex min-h-10 items-center justify-center rounded-xl px-4 py-2 font-sans text-[0.97rem] font-bold text-black shadow-md transition duration-200 hover:-translate-y-0.5"
        :class="[
            active ? 'bg-[#fff0bf] hover:bg-[#fff0bf]' : toneClass(tone),
            fullWidth ? 'w-full' : '',
        ]"
    >
        <slot />
    </component>
</template>
