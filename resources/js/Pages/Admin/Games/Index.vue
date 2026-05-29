<script setup>
import { Head, router } from "@inertiajs/vue3";
import { onBeforeUnmount, reactive } from "vue";
import { route } from "ziggy-js";
import GameListCard from "../../../Components/Admin/GameListCard.vue";
import PaginationControls from "../../../Components/PaginationControls.vue";
import CButton from "../../../Components/UI/CButton.vue";
import CFilterSelect from "../../../Components/UI/CFilterSelect.vue";
import CNumberInput from "../../../Components/UI/CNumberInput.vue";
import CTextInput from "../../../Components/UI/CTextInput.vue";
import CMSLayout from "../../../Layouts/CMSLayout.vue";

defineOptions({ layout: CMSLayout });

const {
    filters: initialFilters,
    filterOptions,
    games,
    pagination,
} = defineProps(["filters", "filterOptions", "games", "pagination"]);

const DEFAULT_SORT = "highest_rated";
const SEARCH_DEBOUNCE_MS = 250;
const defaultFilters = {
    search: "",
    age: "",
    tag: "",
    difficulty: "",
    players: "",
    sort: DEFAULT_SORT,
};

const filters = reactive({
    search: initialFilters.search ?? defaultFilters.search,
    age: initialFilters.age ?? defaultFilters.age,
    tag: initialFilters.tag ?? defaultFilters.tag,
    difficulty: initialFilters.difficulty ?? defaultFilters.difficulty,
    players: initialFilters.players ?? defaultFilters.players,
    sort: initialFilters.sort ?? defaultFilters.sort,
});

let searchDebounceTimer = null;

function clearSearchDebounce() {
    if (!searchDebounceTimer) {
        return;
    }

    window.clearTimeout(searchDebounceTimer);
    searchDebounceTimer = null;
}

function applyFilters(page = 1) {
    clearSearchDebounce();

    router.get(
        route("admin.games.index", {}, false),
        filterQuery(page),
        {
            preserveState: true,
            replace: true,
            preserveScroll: false,
        },
    );
}

function filterQuery(page) {
    return {
        search: filters.search || undefined,
        age: filters.age || undefined,
        tag: filters.tag || undefined,
        difficulty: filters.difficulty || undefined,
        players: filters.players || undefined,
        sort: filters.sort !== DEFAULT_SORT ? filters.sort : undefined,
        page,
    };
}

function queueSearch() {
    clearSearchDebounce();

    searchDebounceTimer = window.setTimeout(() => {
        searchDebounceTimer = null;
        applyFilters(1);
    }, SEARCH_DEBOUNCE_MS);
}

function updateSearch(value) {
    filters.search = value;
    queueSearch();
}

function updateFilter(key, value) {
    filters[key] = value;
    applyFilters(1);
}

function resetFilters() {
    clearSearchDebounce();
    Object.assign(filters, defaultFilters);
    applyFilters(1);
}

onBeforeUnmount(() => {
    clearSearchDebounce();
});
</script>

<template>
    <Head title="Visi stalo žaidimai" />

    <div class="px-6 py-8 sm:px-8 sm:py-10">
        <div
            class="flex flex-col gap-4 lg:flex-row lg:items-center lg:justify-between"
        >
            <h1
                class="font-display text-[2.8rem] uppercase leading-none text-black sm:text-[3.5rem]"
            >
                Visi stalo žaidimai
            </h1>

            <CButton
                :href="route('admin.games.create', {}, false)"
                variant="accent"
            >
                Sukurti naują žaidimą
            </CButton>
        </div>

        <section class="mt-8">
            <div class="grid gap-4 md:grid-cols-2 xl:grid-cols-6">
                <CTextInput
                    id="filter-search"
                    label="Paieška"
                    :model-value="filters.search"
                    placeholder="Ieškokite pagal pavadinimą ar aprašymą"
                    variant="filter"
                    @update:model-value="updateSearch"
                    @keyup.enter="applyFilters(1)"
                />

                <CFilterSelect
                    id="filter-age"
                    :model-value="filters.age"
                    label="Amžius"
                    placeholder="Visi amžiai"
                    :options="filterOptions.age ?? []"
                    @update:model-value="updateFilter('age', $event)"
                />

                <CFilterSelect
                    id="filter-tag"
                    :model-value="filters.tag"
                    label="Kategorija"
                    placeholder="Visos kategorijos"
                    :options="filterOptions.tag ?? []"
                    @update:model-value="updateFilter('tag', $event)"
                />

                <CFilterSelect
                    id="filter-difficulty"
                    :model-value="filters.difficulty"
                    label="Sunkumas"
                    placeholder="Visi lygiai"
                    :options="filterOptions.difficulty ?? []"
                    @update:model-value="updateFilter('difficulty', $event)"
                />

                <CNumberInput
                    id="filter-players"
                    :model-value="filters.players"
                    label="Žaidėjai"
                    min="1"
                    max="20"
                    placeholder="Pvz. 4"
                    variant="filter"
                    @update:model-value="updateFilter('players', $event)"
                />

                <CFilterSelect
                    id="filter-sort"
                    :model-value="filters.sort"
                    label="Rikiuoti"
                    placeholder="Rikiuoti"
                    :options="filterOptions.sort ?? []"
                    :include-placeholder-option="false"
                    @update:model-value="updateFilter('sort', $event)"
                />
            </div>

            <div
                class="mt-5 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between"
            >
                <p
                    class="text-sm font-semibold whitespace-nowrap text-[#7d715f]"
                >
                    {{ pagination.totalLabel }}
                </p>

                <button
                    type="button"
                    class="font-sans text-sm font-semibold leading-none whitespace-nowrap text-black transition duration-200 hover:opacity-70"
                    @click="resetFilters"
                >
                    Išvalyti
                </button>
            </div>
        </section>

        <section class="mt-8">
            <div v-if="games.data.length" class="grid gap-5 xl:grid-cols-2">
                <GameListCard
                    v-for="game in games.data"
                    :key="game.id"
                    :game="game"
                />
            </div>

            <div
                v-else
                class="rounded-4xl border border-mg-border-gray bg-white p-5 text-center shadow-md sm:p-6"
            >
                <template
                    v-if="
                        filters.search ||
                        filters.age ||
                        filters.tag ||
                        filters.difficulty ||
                        filters.players ||
                        filters.sort !== DEFAULT_SORT
                    "
                >
                    <h2
                        class="font-display text-[2rem] leading-none text-black sm:text-[2.4rem]"
                    >
                        Žaidimų nerasta
                    </h2>
                    <p
                        class="mt-3 font-sans text-[1.08rem] leading-7 text-mg-text-gray"
                    >
                        Pabandykite pakeisti paiešką arba išvalyti filtrus.
                    </p>
                </template>
            </div>
        </section>

        <PaginationControls :pagination="pagination" @select="applyFilters" />
    </div>
</template>
