<script setup>
const props = defineProps({
    iconSrc: {
        type: String,
        default: "",
    },
    expanded: {
        type: Boolean,
        default: undefined,
    },
    compact: {
        type: Boolean,
        default: false,
    },
    stopPropagation: {
        type: Boolean,
        default: false,
    },
    imageClass: {
        type: String,
        default: "block h-8 w-8 object-contain",
    },
});

const emit = defineEmits(["click"]);

function handleClick(event) {
    if (props.stopPropagation) {
        event.stopPropagation();
    }

    emit("click", event);
}
</script>

<template>
    <button
        type="button"
        class="inline-flex h-10 w-10 items-center justify-center rounded-xl bg-transparent p-0 text-black transition duration-200 hover:-translate-y-0.5"
        :class="compact ? '!h-9 !w-9' : ''"
        @click="handleClick"
    >
        <slot>
            <img v-if="iconSrc" :src="iconSrc" :class="imageClass" />
        </slot>
    </button>
</template>
