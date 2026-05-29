<script setup>
import CButton from "./UI/CButton.vue";
import availableIconSrc from "@icons/events/available.svg";
import fullIconSrc from "@icons/events/full.svg";
import placeIconSrc from "@icons/events/place.svg";

defineOptions({
    name: "HomeEventCard",
});

const { event } = defineProps(["event"]);

const emit = defineEmits(["open"]);
</script>

<template>
    <article
        class="flex min-h-84 w-60.5 shrink-0 snap-start flex-col overflow-hidden rounded-4xl bg-mg-neutral px-4 py-4 shadow-md sm:w-61.5 sm:px-5 sm:py-5 lg:min-h-76 lg:w-56.5 xl:w-57.5"
    >
        <p
            class="font-sans text-xl font-semibold leading-[1.1] text-black"
        >
            {{ event.startsAtShortLabel }}
        </p>

        <h3
            class="mt-3 font-display text-3xl uppercase leading-[0.94] text-black"
        >
            {{ event.title }}
        </h3>

        <div class="mt-4 space-y-2 text-black">
            <p
                class="flex min-w-0 items-center gap-2 font-sans text-[15px] font-semibold leading-[1.2]"
            >
                <img
                    :src="placeIconSrc"
                    class="h-4 w-4 shrink-0 object-contain"
                />
                <span class="min-w-0 truncate">{{ event.location }}</span>
            </p>

            <p
                class="flex items-center gap-2 font-sans text-[15px] font-semibold leading-[1.2]"
            >
                <img
                    :src="
                        event.seatsState === 'available'
                            ? availableIconSrc
                            : fullIconSrc
                    "
                    class="h-4 w-4 shrink-0 object-contain"
                />
                <span>{{ event.seatsLabel }}</span>
            </p>
        </div>

        <div class="mt-auto pt-6">
            <CButton
                :variant="event.buttonVariant"
                block
                @click="emit('open', event)"
            >
                Renginio informacija
            </CButton>
        </div>
    </article>
</template>
