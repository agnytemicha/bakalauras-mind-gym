<script setup>
import ProfileGameFilterDropdown from "../../../Components/ProfileGameFilterDropdown.vue";
import ProfileGameShelfCard from "../../../Components/ProfileGameShelfCard.vue";

defineProps([
    "gameShelf",
    "filterPanelOpen",
    "filterControls",
    "shelfType",
    "emptyMessage",
]);

defineEmits(["toggle-filter-panel", "update-filter"]);
</script>

<template>
    <div>
        <div v-if="gameShelf.total > 0">
            <div class="mb-5 flex flex-col items-start gap-3">
                <button
                    type="button"
                    class="inline-flex items-center rounded-2xl bg-transparent px-2 py-1 font-sans text-lg font-bold leading-none text-black transition duration-200 hover:-translate-y-0.5"
                    @click="$emit('toggle-filter-panel')"
                >
                    Filtravimas
                </button>

                <div
                    v-if="filterPanelOpen"
                    class="flex w-full flex-wrap items-center justify-start gap-x-8 gap-y-3 pl-2"
                >
                    <ProfileGameFilterDropdown
                        v-for="control in filterControls"
                        :id="control.id"
                        :key="control.key"
                        :display-label="control.displayLabel"
                        :options="control.options"
                        @update:model-value="
                            $emit('update-filter', control.key, $event)
                        "
                    />
                </div>
            </div>

            <div v-if="gameShelf.filteredTotal > 0" class="space-y-4">
                <ProfileGameShelfCard
                    v-for="game in gameShelf.games"
                    :key="game.slug"
                    :game="game"
                    :shelf-type="shelfType"
                />
            </div>
            <p
                v-else-if="gameShelf.hasActiveFilters"
                class="flex min-h-48 items-center justify-center px-6 text-center font-sans text-lg font-semibold italic leading-tight text-black"
            >
                Pagal pasirinktus filtrus žaidimų nerasta.
            </p>
        </div>
        <p
            v-else
            class="flex min-h-64 items-center justify-center px-6 text-center font-sans text-xl font-semibold italic leading-tight text-black"
        >
            {{ emptyMessage }}
        </p>
    </div>
</template>
