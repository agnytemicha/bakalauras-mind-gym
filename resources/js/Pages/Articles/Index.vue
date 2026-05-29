<script setup>
import { Head, router } from "@inertiajs/vue3";
import { onBeforeUnmount, reactive } from "vue";
import ArticleCard from "../../Components/ArticleCard.vue";
import PaginationControls from "../../Components/PaginationControls.vue";
import PublicBlogFilters from "../../Components/PublicBlogFilters.vue";
import PublicLayout from "../../Layouts/PublicLayout.vue";

defineOptions({ layout: PublicLayout });

const {
    filters: initialFilters,
    filterOptions,
    articles,
    pagination,
    resultSummary,
} = defineProps([
    "filters",
    "filterOptions",
    "articles",
    "pagination",
    "resultSummary",
]);

const DEFAULT_SORT = "newest";

const filters = reactive({
    search: initialFilters.search,
    author: initialFilters.author,
    sort: initialFilters.sort,
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
        "/blogs/all",
        {
            search: filters.search || undefined,
            author: filters.author || undefined,
            sort: filters.sort !== DEFAULT_SORT ? filters.sort : undefined,
            page,
        },
        {
            preserveState: true,
            replace: true,
            preserveScroll: false,
        },
    );
}

function updateSearch(value) {
    filters.search = value;
    clearSearchDebounce();

    searchDebounceTimer = window.setTimeout(() => {
        searchDebounceTimer = null;
        applyFilters();
    }, 250);
}

function updateFilter(key, value) {
    filters[key] = value;
    applyFilters();
}

function clearFilters() {
    clearSearchDebounce();
    filters.search = "";
    filters.author = "";
    filters.sort = DEFAULT_SORT;
    applyFilters(1);
}

onBeforeUnmount(clearSearchDebounce);
</script>

<template>
    <Head title="Straipsniai" />

    <section class="section-shell pt-8">
        <PublicBlogFilters
            :filters="filters"
            :filter-options="filterOptions"
            :result-summary="resultSummary"
            @search-input="updateSearch"
            @search-submit="applyFilters"
            @filter-change="updateFilter"
            @clear="clearFilters"
        />
    </section>

    <section class="section-shell mt-10">
        <div
            v-if="articles.data.length"
            class="grid gap-6 md:grid-cols-2 xl:grid-cols-3"
        >
            <ArticleCard
                v-for="(article, index) in articles.data"
                :key="article.slug"
                :article="article"
                :card-index="(pagination.currentPage - 1) * 9 + index"
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
