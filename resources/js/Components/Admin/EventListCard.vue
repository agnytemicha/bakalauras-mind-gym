<script setup>
import { Link, router } from "@inertiajs/vue3";
import { route } from "ziggy-js";
import deleteIconSrc from "@icons/actions/delete.svg";
import editIconSrc from "@icons/actions/edit.svg";
import noPhotoIconSrc from "@icons/content/no-photo.svg";
import placeIconSrc from "@icons/events/place.svg";

const { event } = defineProps(["event"]);

function destroyEvent() {
    if (!window.confirm(`Ar tikrai norite pašalinti "${event.title}"?`)) {
        return;
    }

    router.delete(route("admin.events.destroy", event.id, false), {
        preserveScroll: true,
    });
}
</script>

<template>
    <article
        class="h-full rounded-4xl border border-mg-border-gray bg-white p-5 shadow-md"
    >
        <div class="grid h-full gap-5 md:grid-cols-[10rem_minmax(0,1fr)]">
            <div
                class="flex min-h-48 items-center justify-center overflow-hidden rounded-3xl"
                :class="event.coverImage ? 'bg-white' : 'bg-mg-neutral'"
            >
                <img
                    v-if="event.coverImage"
                    :src="event.coverImage"
                    class="h-full w-full object-cover"
                />
                <img
                    v-else
                    :src="noPhotoIconSrc"
                    class="h-20 w-20 object-contain"
                />
            </div>

            <div class="min-w-0 md:flex md:h-full md:flex-col">
                <div
                    class="grid gap-3 sm:grid-cols-[minmax(0,1fr)_auto] sm:items-start sm:gap-4"
                >
                    <div class="min-w-0">
                        <h2
                            class="font-display text-[32px] leading-none text-black"
                        >
                            {{ event.title }}
                        </h2>
                        <p
                            class="mt-3 min-h-24 overflow-hidden font-sans text-[15px] italic leading-6 text-mg-text-gray [display:-webkit-box] [-webkit-box-orient:vertical] [-webkit-line-clamp:4]"
                        >
                            {{ event.description }}
                        </p>
                    </div>

                    <div
                        class="flex flex-nowrap gap-2 self-start sm:-mt-1 sm:justify-self-end"
                    >
                        <Link
                            :href="route('admin.events.edit', event.id, false)"
                            class="inline-flex h-12 w-12 items-center justify-center rounded-2xl transition duration-200 hover:-translate-y-0.5 hover:opacity-80"
                        >
                            <img
                                :src="editIconSrc"
                                class="h-6 w-6 object-contain"
                            />
                        </Link>
                        <button
                            type="button"
                            class="inline-flex h-12 w-12 items-center justify-center rounded-2xl transition duration-200 hover:-translate-y-0.5 hover:opacity-80"
                            @click="destroyEvent"
                        >
                            <img
                                :src="deleteIconSrc"
                                class="h-6 w-6 object-contain"
                            />
                        </button>
                    </div>
                </div>

                <div class="mt-4 flex flex-col gap-3 md:mt-auto md:pt-4">
                    <div class="flex min-w-0 items-center gap-3">
                        <span
                            class="inline-flex shrink-0 items-center rounded-xl px-3 py-1 font-sans text-xs text-black"
                            :class="event.statusBadgeClass"
                            >{{ event.statusLabel }}</span
                        >
                        <p
                            class="flex min-w-0 flex-1 items-center gap-2 font-sans text-base font-semibold text-mg-text-gray"
                        >
                            <img
                                :src="placeIconSrc"
                                class="h-4 w-4 object-contain"
                            />
                            <span class="truncate">{{ event.location }}</span>
                        </p>
                    </div>

                    <div class="flex flex-wrap gap-x-6 gap-y-2">
                        <p
                            class="font-sans text-[1.08rem] font-semibold leading-7 text-mg-text-gray"
                        >
                            Pradžia:
                            {{ event.startsAtLabel }}
                        </p>
                        <p
                            class="font-sans text-[1.08rem] font-semibold leading-7 text-mg-text-gray"
                        >
                            Pabaiga:
                            {{ event.endsAtLabel }}
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </article>
</template>
