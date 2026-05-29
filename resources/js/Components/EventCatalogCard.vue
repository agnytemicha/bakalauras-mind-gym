<script setup>
import CButton from "./UI/CButton.vue";
import noPhotoIconSrc from "@icons/content/no-photo.svg";
import availableIconSrc from "@icons/events/available.svg";
import fullIconSrc from "@icons/events/full.svg";
import moneyIconSrc from "@icons/events/money.svg";
import placeIconSrc from "@icons/events/place.svg";

defineOptions({
    name: "EventCatalogCard",
});

defineProps(["event"]);

const emit = defineEmits(["register"]);
</script>

<template>
    <article
        class="flex h-full flex-col overflow-hidden rounded-4xl bg-white shadow-md"
    >
        <div class="mx-5 mt-5 overflow-hidden rounded-4xl">
            <img
                v-if="event.coverImage"
                :src="event.coverImage"
                class="h-58 w-full object-cover"
            />
            <div
                v-else
                class="flex h-58 items-center justify-center bg-mg-neutral px-6 text-center"
            >
                <img :src="noPhotoIconSrc" class="h-20 w-20 object-contain" />
            </div>
        </div>

        <div class="flex flex-1 flex-col px-5 pb-5 pt-5">
            <p
                class="text-sm font-black lowercase tracking-[0.22em] text-black"
            >
                {{ event.startsAtLabel }}
            </p>

            <h3
                class="mt-4 font-display text-[1.65rem] uppercase leading-none text-black"
            >
                {{ event.title }}
            </h3>

            <div class="mt-4 space-y-2 text-black">
                <p
                    class="flex items-center gap-2 font-sans text-base font-semibold"
                >
                    <img :src="placeIconSrc" class="h-4 w-4 object-contain" />
                    <span>{{ event.location }}</span>
                </p>
                <p
                    class="flex items-center gap-2 font-sans text-base font-semibold"
                >
                    <img
                        :src="
                            event.seatsState === 'available'
                                ? availableIconSrc
                                : fullIconSrc
                        "
                        class="h-4 w-4 object-contain"
                    />
                    <span>{{ event.seatsLabel }}</span>
                </p>
                <div class="flex flex-wrap items-center gap-3">
                    <span
                        class="rounded-full bg-mg-yellow px-3 py-1 font-sans text-[15px] font-semibold leading-none text-black"
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

            <div class="mt-auto pt-6">
                <CButton
                    variant="primary"
                    block
                    @click="emit('register', event)"
                >
                    Peržiūrėti daugiau
                </CButton>
            </div>
        </div>
    </article>
</template>
