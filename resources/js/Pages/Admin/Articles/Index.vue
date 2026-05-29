<script setup>
import { Head, router } from "@inertiajs/vue3";
import { computed, onBeforeUnmount, reactive } from "vue";
import { route } from "ziggy-js";
import ArticleListCard from "../../../Components/Admin/ArticleListCard.vue";
import CButton from "../../../Components/UI/CButton.vue";
import CFilterSelect from "../../../Components/UI/CFilterSelect.vue";
import CTextInput from "../../../Components/UI/CTextInput.vue";
import CMSLayout from "../../../Layouts/CMSLayout.vue";

defineOptions({ layout: CMSLayout });

const {
    filters: initialFilters,
    filterOptions,
    hasActiveFilters,
    articles,
} = defineProps(["filters", "filterOptions", "hasActiveFilters", "articles"]);

const filters = reactive({
    search: initialFilters.search,
    author: initialFilters.author,
    sort: initialFilters.sort,
});
const resultSummary = computed(() => `Rasta ${articles.length} įrašų`);

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
        route("admin.articles.index", {}, false),
        {
            search: filters.search || undefined,
            author: filters.author || undefined,
            sort: filters.sort !== "newest" ? filters.sort : undefined,
        },
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
    filters.author = "";
    filters.sort = "newest";
    applyFilters();
}

function destroyArticle(article) {
    if (!window.confirm(`Ar tikrai norite pašalinti "${article.title}"?`)) {
        return;
    }

    router.delete(route("admin.articles.destroy", article.id, false), {
        preserveScroll: true,
    });
}

onBeforeUnmount(() => {
    clearSearchDebounce();
});
</script>

<template>
    <Head title="Tinklaraštis" />

    <div class="px-6 py-8 sm:px-8 sm:py-10">
        <div
            class="flex flex-col gap-4 lg:flex-row lg:items-center lg:justify-between"
        >
            <h1
                class="font-display text-[2.8rem] uppercase leading-none text-black sm:text-[3.5rem]"
            >
                Tinklaraštis
            </h1>

            <CButton
                :href="route('admin.articles.create', {}, false)"
                variant="accent"
            >
                Sukurti naują įrašą
            </CButton>
        </div>

        <section class="mt-8">
            <div class="grid gap-4 md:grid-cols-2 xl:grid-cols-3">
                <CTextInput
                    id="filter-search"
                    label="Paieška"
                    :model-value="filters.search"
                    placeholder="Ieškokite pagal pavadinimą ar ištrauką"
                    variant="filter"
                    @update:model-value="updateSearch"
                    @keyup.enter="applyFilters()"
                />

                <CFilterSelect
                    id="filter-author"
                    :model-value="filters.author"
                    label="Autorius"
                    placeholder="Visi autoriai"
                    :options="filterOptions.author"
                    @update:model-value="updateFilter('author', $event)"
                />

                <CFilterSelect
                    id="filter-sort"
                    :model-value="filters.sort"
                    label="Rikiuoti"
                    placeholder="Rikiuoti"
                    :options="filterOptions.sort"
                    :include-placeholder-option="false"
                    @update:model-value="updateFilter('sort', $event)"
                />
            </div>

            <div class="mt-5 flex items-center justify-between gap-4">
                <p
                    class="text-sm font-semibold whitespace-nowrap text-[#7d715f]"
                >
                    {{ resultSummary }}
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
            <div v-if="articles.length" class="grid gap-5 xl:grid-cols-2">
                <ArticleListCard
                    v-for="article in articles"
                    :key="article.id"
                    :article="article"
                    @delete="destroyArticle"
                />
            </div>

            <div
                v-else
                class="rounded-4xl border border-mg-border-gray bg-white p-5 text-center shadow-md"
            >
                <h2
                    class="font-display text-[2rem] leading-none text-black sm:text-[2.4rem]"
                >
                    {{ hasActiveFilters ? "Įrašų nerasta" : "Įrašų dar nėra" }}
                </h2>
                <p
                    class="mt-3 font-sans text-[1.08rem] leading-7 text-mg-text-gray"
                >
                    {{
                        hasActiveFilters
                            ? "Pabandykite pakeisti paiešką arba išvalyti filtrus."
                            : "Sukurkite pirmą įrašą ir pridėkite viršelio nuotrauką iš CMS."
                    }}
                </p>
            </div>
        </section>
    </div>
</template>
