<script setup>
import { Head, router, usePage } from "@inertiajs/vue3";
import { reactive, ref, watch } from "vue";
import EventCatalogCard from "../../Components/EventCatalogCard.vue";
import CompactEventCard from "../../Components/CompactEventCard.vue";
import EventRegistrationModal from "../../Components/EventRegistrationModal.vue";
import CFilterSelect from "../../Components/UI/CFilterSelect.vue";
import PublicLayout from "../../Layouts/PublicLayout.vue";

defineOptions({ layout: PublicLayout });

const {
    filters: initialFilters,
    filterOptions,
    resultSummary,
    upcomingEvents,
    pastEvents,
} = defineProps([
    "filters",
    "filterOptions",
    "resultSummary",
    "upcomingEvents",
    "pastEvents",
]);

const page = usePage();
const selectedEvent = ref(null);

const filters = reactive({
    place: initialFilters.place,
    difficulty: initialFilters.difficulty,
    price: initialFilters.price,
    show: initialFilters.show,
    date: initialFilters.date,
});

function clearSelectedEventQueryParam() {
    if (typeof window === "undefined") {
        return;
    }

    const url = new URL(window.location.href);
    url.searchParams.delete("event");

    window.history.replaceState(
        window.history.state,
        "",
        `${url.pathname}${url.search}${url.hash}`,
    );
}

function applyFilters() {
    router.get("/events", eventFilterQuery(), {
        preserveState: true,
        replace: true,
        preserveScroll: true,
    });
}

function eventFilterQuery() {
    return {
        place: filters.place || undefined,
        difficulty: filters.difficulty || undefined,
        price: filters.price || undefined,
        show: filters.show !== "all" ? filters.show : undefined,
        date: filters.date || undefined,
    };
}

function updateFilter(key, value) {
    filters[key] = value;
    applyFilters();
}

function clearFilters() {
    Object.assign(filters, {
        place: "",
        difficulty: "",
        price: "",
        show: "all",
        date: "",
    });
    applyFilters();
}

function openEventRegistration(event) {
    selectedEvent.value = event;
}

function closeEventRegistration() {
    selectedEvent.value = null;
    clearSelectedEventQueryParam();
}

function eventSlugFromUrl(url) {
    return new URL(url ?? "/events", "http://localhost").searchParams.get(
        "event",
    );
}

function syncSelectedEventFromUrl(url) {
    const slug = eventSlugFromUrl(url);

    if (!slug) {
        selectedEvent.value = null;
        return;
    }

    selectedEvent.value =
        upcomingEvents.find((event) => event.slug === slug) ?? null;

    if (!selectedEvent.value) {
        clearSelectedEventQueryParam();
    }
}

watch(
    () => page.url,
    (url) => {
        syncSelectedEventFromUrl(url);
    },
    { immediate: true },
);
</script>

<template>
    <Head title="Renginiai" />

    <section class="section-shell pt-8">
        <div class="grid gap-4 xl:grid-cols-5">
            <CFilterSelect
                id="public-event-filter-place"
                :model-value="filters.place"
                label="Vieta"
                placeholder="Visos vietos"
                :options="filterOptions.place"
                @update:model-value="updateFilter('place', $event)"
            />

            <CFilterSelect
                id="public-event-filter-difficulty"
                :model-value="filters.difficulty"
                label="Sudėtingumas"
                placeholder="Visiems"
                :options="filterOptions.difficulty"
                @update:model-value="updateFilter('difficulty', $event)"
            />

            <CFilterSelect
                id="public-event-filter-price"
                :model-value="filters.price"
                label="Kaina"
                placeholder="Visi"
                :options="filterOptions.price"
                @update:model-value="updateFilter('price', $event)"
            />

            <CFilterSelect
                id="public-event-filter-date"
                :model-value="filters.date"
                label="Data"
                placeholder="Visos datos"
                :options="filterOptions.date"
                @update:model-value="updateFilter('date', $event)"
            />

            <CFilterSelect
                id="public-event-filter-show"
                :model-value="filters.show"
                label="Rodyti"
                placeholder="Rodyti"
                :options="filterOptions.show"
                :include-placeholder-option="false"
                @update:model-value="updateFilter('show', $event)"
            />
        </div>

        <div class="mt-5 flex items-center justify-between gap-4">
            <p class="text-sm font-semibold whitespace-nowrap text-[#7d715f]">
                {{ resultSummary }}
            </p>

            <button
                type="button"
                class="font-sans text-sm font-semibold leading-none whitespace-nowrap text-black transition duration-200 hover:opacity-70"
                @click="clearFilters"
            >
                Išvalyti
            </button>
        </div>
    </section>

    <section class="section-shell mt-10">
        <div class="mb-6">
            <p class="font-display text-3xl uppercase text-black">
                Ateinantys renginiai
            </p>
        </div>

        <div class="grid gap-6 lg:grid-cols-3" v-if="upcomingEvents.length">
            <EventCatalogCard
                v-for="event in upcomingEvents"
                :key="event.slug"
                :event="event"
                @register="openEventRegistration"
            />
        </div>

        <div
            v-else
            class="rounded-4xl bg-white px-6 py-10 text-center shadow-md"
        >
            <p class="font-display text-3xl uppercase text-black">
                Renginių dar ruošiame
            </p>
            <p class="mt-4 text-sm leading-7 text-zinc-700">
                Sek naujienas, nes netrukus atsiras nauji susitikimai.
            </p>
        </div>
    </section>

    <section class="section-shell mt-12" v-if="pastEvents.length">
        <div class="mb-6">
            <p class="font-display text-3xl uppercase text-black">
                Jau įvykę renginiai
            </p>
            <p class="mt-2 text-sm font-semibold leading-7 text-zinc-700">
                Keletas paskutinių susitikimų.
            </p>
        </div>

        <div class="grid gap-4 md:grid-cols-3">
            <CompactEventCard
                v-for="event in pastEvents"
                :key="event.slug"
                :event="event"
            />
        </div>
    </section>

    <EventRegistrationModal
        v-if="selectedEvent"
        :event="selectedEvent"
        @close="closeEventRegistration"
    />
</template>
