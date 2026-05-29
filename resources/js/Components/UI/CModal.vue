<script setup>
import { onBeforeUnmount, ref, watch } from "vue";

const props = defineProps({
    open: {
        type: Boolean,
        default: false,
    },
    title: {
        type: String,
        default: "",
    },
    heading: {
        type: String,
        default: "",
    },
    description: {
        type: String,
        default: "",
    },
    maxWidthClass: {
        type: String,
        default: "max-w-2xl",
    },
    panelClass: {
        type: String,
        default: "",
    },
    bodyClass: {
        type: String,
        default: "",
    },
    actionsClass: {
        type: String,
        default: "mt-6 flex flex-wrap justify-end gap-3",
    },
    showCloseButton: {
        type: Boolean,
        default: true,
    },
});

const emit = defineEmits(["close"]);
const bodyLocked = ref(false);

function emitClose() {
    emit("close");
}

function lockBody() {
    if (bodyLocked.value || typeof document === "undefined") {
        return;
    }

    document.body.style.overflow = "hidden";
    bodyLocked.value = true;
}

function unlockBody() {
    if (!bodyLocked.value || typeof document === "undefined") {
        return;
    }

    document.body.style.overflow = "";
    bodyLocked.value = false;
}

watch(
    () => props.open,
    (open) => {
        if (open) {
            lockBody();
            return;
        }

        unlockBody();
    },
    { immediate: true },
);

onBeforeUnmount(() => {
    unlockBody();
});
</script>

<template>
    <Teleport to="body">
        <Transition
            enter-active-class="transition duration-200"
            enter-from-class="opacity-0"
            enter-to-class="opacity-100"
            leave-active-class="transition duration-150"
            leave-from-class="opacity-100"
            leave-to-class="opacity-0"
        >
            <div
                v-if="open"
                class="fixed inset-0 z-[80] flex items-center justify-center bg-black/45 px-4 py-8"
                @click="emitClose"
            >
                <div
                    class="relative w-full rounded-2xl bg-mg-blue px-6 py-6 shadow-md sm:px-8 sm:py-8"
                    :class="[maxWidthClass, panelClass]"
                    @click.stop
                >
                    <button
                        v-if="showCloseButton"
                        type="button"
                        class="absolute right-4 top-4 inline-flex h-8 w-8 items-center justify-center rounded-full bg-mg-red font-sans text-[1.8rem] leading-none text-black shadow-md transition duration-200 hover:-translate-y-0.5"
                        @click="emitClose"
                    >
                        ×
                    </button>

                    <p
                        v-if="title"
                        class="px-10 text-center font-display text-3xl leading-none text-black"
                    >
                        {{ title }}
                    </p>
                    <p
                        v-if="heading"
                        class="mt-3 pr-8 font-sans text-lg font-semibold leading-[1.28] text-black"
                    >
                        {{ heading }}
                    </p>
                    <p
                        v-if="description"
                        class="mt-4 font-sans text-lg font-semibold leading-[1.28] text-black"
                    >
                        {{ description }}
                    </p>

                    <div
                        v-if="$slots.default"
                        :class="[
                            title || heading || description ? 'mt-6' : '',
                            bodyClass,
                        ]"
                    >
                        <slot />
                    </div>

                    <div v-if="$slots.actions" :class="actionsClass">
                        <slot name="actions" />
                    </div>
                </div>
            </div>
        </Transition>
    </Teleport>
</template>
