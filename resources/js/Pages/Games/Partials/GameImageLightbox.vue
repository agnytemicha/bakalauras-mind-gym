<script setup>
import { onBeforeUnmount, watch } from "vue";
import CarouselArrowButton from "../../../Components/CarouselArrowButton.vue";

const { open, images, activeImageIndex } = defineProps([
    "open",
    "images",
    "activeImageIndex",
]);

const emit = defineEmits(["close", "previous-image", "next-image"]);

watch(
    () => open && images.length > 0,
    (visible) => {
        if (typeof document === "undefined") {
            return;
        }

        document.body.style.overflow = visible ? "hidden" : "";
    },
    { immediate: true },
);

onBeforeUnmount(() => {
    if (typeof document !== "undefined") {
        document.body.style.overflow = "";
    }
});
</script>

<template>
    <Teleport to="body">
        <div
            v-if="open && images.length"
            class="fixed inset-0 z-70 flex items-center justify-center bg-black/90 px-4 py-6"
            @click="emit('close')"
        >
            <button
                type="button"
                class="fixed right-3 top-3 z-20 inline-flex h-8 w-8 items-center justify-center rounded-full bg-mg-red font-sans text-[1.8rem] leading-none text-black shadow-md transition duration-200 hover:-translate-y-0.5 sm:right-5 sm:top-5"
                @click.stop="emit('close')"
            >
                X
            </button>

            <div
                class="relative flex w-full max-w-6xl items-center justify-center"
                @click.stop
            >
                <CarouselArrowButton
                    v-if="images.length > 1"
                    direction="previous"
                    class="absolute left-0 top-1/2 z-10 -translate-y-1/2 sm:left-4"
                    @click="emit('previous-image')"
                />

                <figure
                    class="flex w-full flex-col items-center justify-center"
                >
                    <div class="flex w-full justify-center px-3 sm:px-20">
                        <img
                            :src="images[activeImageIndex].url"
                            class="max-h-[82vh] w-auto max-w-full rounded-3xl object-contain shadow-md"
                        />
                    </div>
                    <figcaption
                        class="mt-4 text-sm font-semibold text-white/80"
                    >
                        {{ activeImageIndex + 1 }} / {{ images.length }}
                    </figcaption>
                </figure>

                <CarouselArrowButton
                    v-if="images.length > 1"
                    direction="next"
                    class="absolute right-0 top-1/2 z-10 -translate-y-1/2 sm:right-4"
                    @click="emit('next-image')"
                />
            </div>
        </div>
    </Teleport>
</template>
