<script setup>
import { router } from "@inertiajs/vue3";
import { ref } from "vue";
import { route } from "ziggy-js";
import deleteIconSrc from "@icons/actions/delete.svg";
import noPhotoIconSrc from "@icons/content/no-photo.svg";
import moneyIconSrc from "@icons/events/money.svg";

defineOptions({
    name: "ProfileEventRegistrationCard",
});

const { event } = defineProps(["event"]);

const emit = defineEmits(["open"]);

const isUnregisterPending = ref(false);

function openEvent() {
    emit("open", event);
}

function unregisterFromEvent() {
    if (isUnregisterPending.value) {
        return;
    }

    isUnregisterPending.value = true;

    router.delete(route("events.unregister", event.slug, false), {
        preserveScroll: true,
        preserveState: true,
        onFinish: () => {
            isUnregisterPending.value = false;
        },
    });
}
</script>

<template>
    <article
        class="relative grid min-h-[120px] w-full grid-cols-[auto_minmax(0,1fr)] items-start gap-4 overflow-hidden rounded-3xl bg-mg-red px-5 py-4 text-left shadow-md transition duration-200 hover:-translate-y-0.5"
    >
        <button
            type="button"
            class="absolute inset-0 z-10 rounded-3xl"
            @click="openEvent"
        />

        <div class="absolute right-4 top-4 z-20">
            <button
                type="button"
                class="inline-flex h-10 w-10 items-center justify-center rounded-full transition duration-200 hover:-translate-y-0.5 disabled:cursor-not-allowed disabled:opacity-60"
                :disabled="isUnregisterPending"
                @click.stop="unregisterFromEvent"
            >
                <img :src="deleteIconSrc" class="h-5 w-5 object-contain" />
            </button>
        </div>

        <div
            class="relative z-0 flex h-20 w-20 items-center justify-center self-start overflow-hidden rounded-3xl bg-white/55 shadow-md sm:h-24 sm:w-24"
        >
            <img
                v-if="event.coverImage"
                :src="event.coverImage"
                class="h-full w-full object-cover"
            />
            <div
                v-else
                class="flex h-full w-full items-center justify-center bg-mg-neutral"
            >
                <img
                    :src="noPhotoIconSrc"
                    class="h-12 w-12 object-contain sm:h-14 sm:w-14"
                />
            </div>
        </div>

        <div
            class="relative z-0 flex min-h-20 min-w-0 flex-col self-stretch pr-12 sm:min-h-24 sm:pr-16"
        >
            <p
                class="text-base font-black uppercase tracking-[0.18em] text-black/70"
            >
                {{ event.startsAtLabel }}
            </p>

            <h3
                class="mt-2 font-display text-[28px] uppercase leading-none text-black"
            >
                {{ event.title }}
            </h3>

            <div
                class="mt-auto flex flex-wrap items-center gap-3 pb-1 pt-2 text-zinc-800"
            >
                <span
                    class="rounded-full bg-mg-yellow px-3 py-1.5 text-[15px] font-semibold leading-none shadow-md"
                >
                    {{ event.difficultyLabel }}
                </span>
                <img
                    v-if="event.isPaid"
                    :src="moneyIconSrc"
                    class="h-5 w-5 object-contain"
                />
            </div>
        </div>
    </article>
</template>
