<script setup>
import CFilterSelect from "./UI/CFilterSelect.vue";
import CTextInput from "./UI/CTextInput.vue";

defineProps({
    filters: {
        type: Object,
        required: true,
    },
    filterOptions: {
        type: Object,
        required: true,
    },
    resultSummary: {
        type: String,
        required: true,
    },
});

const emit = defineEmits([
    "search-input",
    "search-submit",
    "filter-change",
    "clear",
]);

function updateFilter(key, value) {
    emit("filter-change", key, value);
}
</script>

<template>
    <section>
        <form
            class="grid gap-4 md:grid-cols-2 xl:grid-cols-3"
            @submit.prevent="emit('search-submit')"
        >
            <CTextInput
                id="public-blog-filter-search"
                label="Paieška"
                :model-value="filters.search"
                placeholder="Ieškokite pagal pavadinimą ar ištrauką"
                variant="filter"
                @update:model-value="emit('search-input', $event)"
                @keyup.enter="emit('search-submit')"
            />

            <CFilterSelect
                id="public-blog-filter-author"
                :model-value="filters.author"
                label="Autorius"
                placeholder="Visi autoriai"
                :options="filterOptions.author"
                @update:model-value="updateFilter('author', $event)"
            />

            <CFilterSelect
                id="public-blog-filter-sort"
                :model-value="filters.sort"
                label="Rikiuoti"
                placeholder="Rikiuoti"
                :options="filterOptions.sort"
                :include-placeholder-option="false"
                @update:model-value="updateFilter('sort', $event)"
            />
        </form>

        <div class="mt-5 flex items-center justify-between gap-4">
            <p class="text-sm font-semibold whitespace-nowrap text-[#7d715f]">
                {{ resultSummary }}
            </p>

            <button
                type="button"
                class="font-sans text-sm font-semibold leading-none whitespace-nowrap text-black transition duration-200 hover:opacity-70"
                @click="emit('clear')"
            >
                Išvalyti
            </button>
        </div>
    </section>
</template>
