<script setup>
import { usePage } from "@inertiajs/vue3";
import { onBeforeUnmount, ref, watch } from "vue";

const page = usePage();
const activeMessage = ref(null);
const isVisible = ref(false);

let hideTimer = null;

function clearHideTimer() {
    if (hideTimer && typeof window !== "undefined") {
        window.clearTimeout(hideTimer);
    }

    hideTimer = null;
}

watch(
    () => page.props.flash,
    (message) => {
        if (!message) {
            return;
        }

        clearHideTimer();
        activeMessage.value = message;
        isVisible.value = true;

        if (typeof window === "undefined") {
            return;
        }

        hideTimer = window.setTimeout(() => {
            isVisible.value = false;
        }, message.duration);
    },
    { immediate: true },
);

onBeforeUnmount(() => {
    clearHideTimer();
});
</script>

<template>
    <Transition
        enter-active-class="transition duration-300"
        enter-from-class="scale-95 opacity-0"
        enter-to-class="scale-100 opacity-100"
        leave-active-class="transition duration-200"
        leave-from-class="scale-100 opacity-100"
        leave-to-class="scale-95 opacity-0"
    >
        <div
            v-if="activeMessage && isVisible"
            class="pointer-events-none fixed bottom-4 right-4 z-60 min-w-64 max-w-[min(calc(100vw-2rem),24rem)] origin-bottom-right rounded-xl px-4 py-3 text-left font-sans text-base font-semibold leading-[1.35] text-black shadow-md sm:bottom-6 sm:right-6"
            :class="
                activeMessage.type === 'success'
                    ? 'bg-mg-yellow'
                    : 'bg-mg-blue'
            "
        >
            {{ activeMessage.text }}
        </div>
    </Transition>
</template>
