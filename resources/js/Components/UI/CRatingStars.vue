<script setup>
import { computed } from "vue";
import starIconSrc from "@icons/rating/star.svg";

defineOptions({
    name: "CRatingStars",
});

const props = defineProps({
    rating: {
        type: [Number, String],
        default: 0,
    },
    iconClass: {
        type: [String, Array, Object],
        default: "h-5 w-5 object-contain",
    },
});

const starCount = computed(() =>
    Math.max(0, Math.min(5, Math.round(Number(props.rating) || 0))),
);

const ratingLabel = computed(() => `Įvertinimas: ${starCount.value} iš 5`);
</script>

<template>
    <div class="flex items-center" role="img" :aria-label="ratingLabel">
        <img
            v-for="index in starCount"
            :key="index"
            :src="starIconSrc"
            :class="iconClass"
            alt=""
        />
    </div>
</template>
