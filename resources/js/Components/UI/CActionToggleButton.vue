<script setup>
defineProps(["active", "disabled", "iconSrc", "label"]);

defineEmits(["click"]);
</script>

<template>
    <button
        type="button"
        class="inline-flex items-center gap-2 rounded-full transition duration-200 hover:-translate-y-0.5 disabled:cursor-not-allowed disabled:opacity-60"
        :disabled="disabled"
        @click="$emit('click')"
    >
        <span
            class="inline-flex h-9 w-9 shrink-0 items-center justify-center rounded-full"
            :class="
                active
                    ? 'bg-mg-yellow shadow-md'
                    : 'bg-white/70'
            "
        >
            <img :src="iconSrc" class="h-9 w-9 object-contain" />
        </span>
        <span
            class="whitespace-nowrap font-sans text-lg font-semibold leading-none text-black"
        >
            - {{ label }}
        </span>
    </button>
</template>
