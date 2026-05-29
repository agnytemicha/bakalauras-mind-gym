<script setup>
import { Head, router } from "@inertiajs/vue3";
import { onBeforeUnmount, reactive } from "vue";
import { route } from "ziggy-js";
import EventListCard from "../../../Components/Admin/EventListCard.vue";
import CButton from "../../../Components/UI/CButton.vue";
import CFilterSelect from "../../../Components/UI/CFilterSelect.vue";
import CTextInput from "../../../Components/UI/CTextInput.vue";
import CMSLayout from "../../../Layouts/CMSLayout.vue";

defineOptions({ layout: CMSLayout });

const {
    filters: initialFilters,
    filterOptions,
    events,
} = defineProps(["filters", "filterOptions", "events"]);

const filters = reactive({
    search: initialFilters.search,
    place: initialFilters.place,
    difficulty: initialFilters.difficulty,
    price: initialFilters.price,
    show: initialFilters.show,
    date: initialFilters.date,
});

let searchDebounceTimer = null;

function clearSearchDebounce() {
    if (!searchDebounceTimer) {
        return;
    }

    window.clearTimeout(searchDebounceTimer);
    searchDebounceTimer = null;
}

function applyFilters() {
    clearSearchDebounce();

    router.get(
        route("admin.events.index", {}, false),
        { ...filters },
        {
            preserveState: true,
            replace: true,
            preserveScroll: true,
        },
    );
}

function queueSearch() {
    clearSearchDebounce();

    searchDebounceTimer = window.setTimeout(() => {
        searchDebounceTimer = null;
        applyFilters();
    }, 250);
}

function updateSearch(value) {
    filters.search = value;
    queueSearch();
}

function updateFilter(key, value) {
    filters[key] = value;
    applyFilters();
}

function resetFilters() {
    clearSearchDebounce();
    filters.search = "";
    filters.place = "";
    filters.difficulty = "";
    filters.price = "";
    filters.show = "all";
    filters.date = "";
    applyFilters();
}

onBeforeUnmount(() => {
    clearSearchDebounce();
});
</script>

<template>
    <Head title="Renginiai" />

    <div class="px-6 py-8 sm:px-8 sm:py-10">
        <div
            class="flex flex-col gap-4 lg:flex-row lg:items-center lg:justify-between"
        >
            <div>
                <h1
                    class="font-display text-[2.8rem] uppercase leading-none text-black sm:text-[3.5rem]"
                >
                    Renginiai
                </h1>
            </div>

            <CButton
                :href="route('admin.events.create', {}, false)"
                variant="accent"
            >
                Sukurti naują renginį
            </CButton>
        </div>

        <section class="mt-8">
            <div class="grid gap-4 md:grid-cols-2 xl:grid-cols-6">
                <CTextInput
                    id="filter-search"
                    label="Paieška"
                    :model-value="filters.search"
                    placeholder="Ieškokite pagal pavadinimą, aprašymą ar vietą"
                    @update:model-value="updateSearch"
                    @keyup.enter="applyFilters()"
                />

                <CFilterSelect
                    id="filter-place"
                    :model-value="filters.place"
                    label="Vieta"
                    placeholder="Visos vietos"
                    :options="filterOptions.place"
                    @update:model-value="updateFilter('place', $event)"
                />

                <CFilterSelect
                    id="filter-difficulty"
                    :model-value="filters.difficulty"
                    label="Sudėtingumas"
                    placeholder="Visiems"
                    :options="filterOptions.difficulty"
                    @update:model-value="updateFilter('difficulty', $event)"
                />

                <CFilterSelect
                    id="filter-price"
                    :model-value="filters.price"
                    label="Kaina"
                    placeholder="Visi"
                    :options="filterOptions.price"
                    @update:model-value="updateFilter('price', $event)"
                />

                <CFilterSelect
                    id="filter-date"
                    :model-value="filters.date"
                    label="Data"
                    placeholder="Visos datos"
                    :options="filterOptions.date"
                    @update:model-value="updateFilter('date', $event)"
                />

                <CFilterSelect
                    id="filter-show"
                    :model-value="filters.show"
                    label="Rodyti"
                    placeholder="Rodyti"
                    :options="filterOptions.show"
                    :include-placeholder-option="false"
                    @update:model-value="updateFilter('show', $event)"
                />
            </div>

            <div class="mt-5 flex items-center justify-between gap-4">
                <p
                    class="text-sm font-semibold whitespace-nowrap text-[#7d715f]"
                >
                    Rasta {{ events.length }} renginių
                </p>

                <button
                    type="button"
                    class="whitespace-nowrap font-sans text-sm font-semibold leading-none text-black transition duration-200 hover:opacity-70"
                    @click="resetFilters"
                >
                    Išvalyti
                </button>
            </div>
        </section>

        <section class="mt-8">
            <div v-if="events.length" class="grid gap-5 xl:grid-cols-2">
                <EventListCard
                    v-for="event in events"
                    :key="event.id"
                    :event="event"
                />
            </div>

            <div
                v-else
                class="rounded-4xl border border-mg-border-gray bg-white p-5 text-center shadow-md"
            >
                <template
                    v-if="
                        filters.search ||
                        filters.place ||
                        filters.difficulty ||
                        filters.price ||
                        filters.date ||
                        filters.show !== 'all'
                    "
                >
                    <h2
                        class="font-display text-[2rem] leading-none text-black sm:text-[2.4rem]"
                    >
                        Renginių nerasta
                    </h2>
                    <p
                        class="mt-3 font-sans text-[1.08rem] leading-7 text-mg-text-gray"
                    >
                        Pabandykite pakeisti paiešką arba išvalyti filtrus.
                    </p>
                </template>
            </div>
        </section>
    </div>
</template>
