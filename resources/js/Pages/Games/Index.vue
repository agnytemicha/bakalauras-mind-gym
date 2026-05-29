<script setup>
import { Head, router } from "@inertiajs/vue3";
import { reactive } from "vue";
import GameCatalogCard from "../../Components/GameCatalogCard.vue";
import PaginationControls from "../../Components/PaginationControls.vue";
import CFilterSelect from "../../Components/UI/CFilterSelect.vue";
import CNumberInput from "../../Components/UI/CNumberInput.vue";
import PublicLayout from "../../Layouts/PublicLayout.vue";

defineOptions({ layout: PublicLayout });

const {
    filters: initialFilters,
    filterOptions,
    games,
    pagination,
} = defineProps(["filters", "filterOptions", "games", "pagination"]);

const filters = reactive({
    age: initialFilters.age,
    tag: initialFilters.tag,
    difficulty: initialFilters.difficulty,
    players: initialFilters.players,
    sort: initialFilters.sort,
});

function applyFilters(page = 1) {
    router.get(
        "/games",
        {
            age: filters.age || undefined,
            tag: filters.tag || undefined,
            difficulty: filters.difficulty || undefined,
            players: filters.players || undefined,
            sort: filters.sort || undefined,
            page,
        },
        { preserveState: true, replace: true, preserveScroll: false },
    );
}

function updateFilter(key, value) {
    filters[key] = value;
    applyFilters();
}

function clearFilters() {
    filters.age = "";
    filters.tag = "";
    filters.difficulty = "";
    filters.players = "";
    filters.sort = "highest_rated";
    applyFilters(1);
}
</script>

<template>
    <Head title="Stalo žaidimai" />

    <section class="section-shell pt-8">
        <div class="grid gap-4 xl:grid-cols-5">
            <CFilterSelect
                id="public-filter-age"
                :model-value="filters.age"
                label="Amžius"
                placeholder="Visi amžiai"
                :options="filterOptions.age"
                @update:model-value="updateFilter('age', $event)"
            />

            <CFilterSelect
                id="public-filter-tag"
                :model-value="filters.tag"
                label="Kategorija"
                placeholder="Visos kategorijos"
                :options="filterOptions.tag"
                @update:model-value="updateFilter('tag', $event)"
            />

            <CFilterSelect
                id="public-filter-difficulty"
                :model-value="filters.difficulty"
                label="Sunkumas"
                placeholder="Visi lygiai"
                :options="filterOptions.difficulty"
                @update:model-value="updateFilter('difficulty', $event)"
            />

            <CNumberInput
                id="public-filter-players"
                :model-value="filters.players"
                label="Žaidėjai"
                min="1"
                max="20"
                placeholder="Pvz. 4"
                variant="filter"
                @update:model-value="updateFilter('players', $event)"
            />

            <CFilterSelect
                id="public-filter-sort"
                :model-value="filters.sort"
                label="Rikiuoti"
                placeholder="Rikiuoti"
                :options="filterOptions.sort"
                @update:model-value="updateFilter('sort', $event)"
            />
        </div>

        <div class="mt-5 flex items-center justify-between gap-4">
            <p class="text-sm font-semibold whitespace-nowrap text-[#7d715f]">
                {{ pagination.totalLabel }}
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
        <div
            v-if="games.data.length"
            class="grid gap-6 md:grid-cols-2 xl:grid-cols-3"
        >
            <GameCatalogCard
                v-for="game in games.data"
                :key="game.slug"
                :game="game"
            />
        </div>

        <div v-else class="px-6 py-10 text-center">
            <p class="font-display text-3xl uppercase text-black">
                Nieko neradome
            </p>
            <p class="mt-4 text-sm leading-7 text-zinc-700">
                Pabandykite pakeisti pasirinktus filtrus.
            </p>
        </div>

        <PaginationControls :pagination="pagination" @select="applyFilters" />
    </section>
</template>
