<script setup>
const { pagination } = defineProps(["pagination"]);

const emit = defineEmits(["select"]);

function selectPage(page) {
    if (
        page < 1 ||
        page > pagination.lastPage ||
        page === pagination.currentPage
    ) {
        return;
    }

    emit("select", page);
}
</script>

<template>
    <nav
        v-if="pagination.lastPage > 1"
        class="mt-8 flex flex-wrap items-center justify-center gap-2"
    >
        <button
            type="button"
            class="flex h-11 min-w-11 items-center justify-center rounded-2xl border border-mg-border-gray bg-white px-3 font-sans text-sm font-semibold text-[#4b4b4b] shadow-md transition duration-200 hover:-translate-y-0.5 hover:bg-[#fff8ec] disabled:cursor-not-allowed disabled:opacity-45"
            :disabled="pagination.currentPage <= 1"
            @click="selectPage(pagination.currentPage - 1)"
        >
            &lt;
        </button>

        <button
            v-for="page in pagination.pages"
            :key="page"
            type="button"
            class="flex h-11 min-w-11 items-center justify-center rounded-2xl border border-mg-border-gray bg-white px-3 font-sans text-sm font-semibold text-[#4b4b4b] shadow-md transition duration-200 hover:-translate-y-0.5 hover:bg-[#fff8ec] disabled:cursor-not-allowed disabled:opacity-45"
            :class="
                page === pagination.currentPage
                    ? 'bg-mg-yellow text-black hover:translate-y-0 hover:bg-mg-yellow'
                    : ''
            "
            @click="selectPage(page)"
        >
            {{ page }}
        </button>

        <button
            type="button"
            class="flex h-11 min-w-11 items-center justify-center rounded-2xl border border-mg-border-gray bg-white px-3 font-sans text-sm font-semibold text-[#4b4b4b] shadow-md transition duration-200 hover:-translate-y-0.5 hover:bg-[#fff8ec] disabled:cursor-not-allowed disabled:opacity-45"
            :disabled="pagination.currentPage >= pagination.lastPage"
            @click="selectPage(pagination.currentPage + 1)"
        >
            &gt;
        </button>
    </nav>
</template>
