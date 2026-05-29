<script setup>
import arrowIconSrc from "@icons/actions/arrow.svg";

defineProps({
    direction: {
        type: String,
        default: "next",
    },
    size: {
        type: String,
        default: "md",
    },
});

defineEmits(["click"]);
</script>

<template>
    <button
        type="button"
        class="hidden items-center justify-center bg-mg-neutral text-black shadow-md transition duration-200 [@media(hover:hover)_and_(pointer:fine)]:inline-flex"
        :class="
            size === 'lg'
                ? 'h-14 w-14 rounded-2xl hover:-translate-y-0.5 sm:h-16 sm:w-16'
                : 'h-12 w-12 rounded-2xl'
        "
        @click="$emit('click')"
    >
        <img
            :src="arrowIconSrc"
            class="h-6 w-6 object-contain"
            :class="direction === 'previous' ? 'rotate-180' : ''"
            alt=""
        />
    </button>
</template>
