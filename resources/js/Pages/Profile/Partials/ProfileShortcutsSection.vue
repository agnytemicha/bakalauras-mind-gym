<script setup>
import { router, usePage } from "@inertiajs/vue3";
import { onBeforeUnmount, onMounted, ref, watch } from "vue";
import heartIconSrc from "@icons/actions/heart.svg";
import eventsIconSrc from "@icons/profile/events.svg";
import faqIconSrc from "@icons/profile/faq.svg";
import ownedGamesIconSrc from "@icons/profile/games.svg";
import wishlistIconSrc from "@icons/profile/wishlist.svg";
import EventRegistrationModal from "../../../Components/EventRegistrationModal.vue";
import ProfileEventsPanel from "./ProfileEventsPanel.vue";
import ProfileFaqPanel from "./ProfileFaqPanel.vue";
import ProfileGameShelfPanel from "./ProfileGameShelfPanel.vue";
import ProfileTabs from "./ProfileTabs.vue";

const props = defineProps([
    "gameShelves",
    "gameFilters",
    "registeredEventSections",
]);

const page = usePage();
const selectedProfileEvent = ref(null);

const isFilterPanelOpen = ref(false);

watch(() => activeTab(), syncFilterPanelWithActiveShelf, { immediate: true });

watch(
    () => activeGameShelfData()?.hasActiveFilters,
    (hasActiveFilters) => {
        if (hasActiveFilters) {
            isFilterPanelOpen.value = true;
        }
    },
);

onMounted(() => {
    window.addEventListener("profile-shortcut-activate", activateProfileTab);
});

onBeforeUnmount(() => {
    window.removeEventListener("profile-shortcut-activate", activateProfileTab);
});

function getTabFromUrl(url) {
    const [, search = ""] = `${url ?? "/profile"}`.split("?");
    const tab = new URLSearchParams(search).get("tab");

    return isValidProfileTab(tab) ? tab : "owned";
}

function activeTab() {
    return getTabFromUrl(page.url);
}

function activeGameShelfData() {
    const tab = activeTab();

    if (!isGameShelfTab(tab)) {
        return null;
    }

    return props.gameShelves[tab];
}

function activeGameFilterControls() {
    const tab = activeTab();

    if (!isGameShelfTab(tab)) {
        return [];
    }

    const controls = [];

    for (const control of props.gameFilters.controls) {
        controls.push({
            ...control,
            id: `profile-${tab}-filter-${control.key}`,
        });
    }

    return controls;
}

function syncFilterPanelWithActiveShelf() {
    isFilterPanelOpen.value = Boolean(activeGameShelfData()?.hasActiveFilters);
}

function activateProfileTab(event) {
    selectProfileTab(event.detail?.tab);
}

function isValidProfileTab(tab) {
    return ["owned", "wishlist", "favorites", "events", "faq"].includes(tab);
}

function toggleActiveShelfFilterPanel() {
    const tab = activeTab();

    if (!isGameShelfTab(tab)) {
        return;
    }

    if (isFilterPanelOpen.value) {
        isFilterPanelOpen.value = false;

        if (activeGameShelfData()?.hasActiveFilters) {
            visitProfileTab(tab);
        }

        return;
    }

    isFilterPanelOpen.value = true;
}

function updateActiveGameFilter(filterKey, value) {
    const tab = activeTab();

    if (!isGameShelfTab(tab)) {
        return;
    }

    visitProfileTab(tab, {
        ...props.gameFilters.filters,
        [filterKey]: value,
    });
}

function selectProfileTab(tab) {
    if (!isValidProfileTab(tab)) {
        return;
    }

    visitProfileTab(tab);
}

function visitProfileTab(tab, filters = {}) {
    const query = { tab };

    if (isGameShelfTab(tab)) {
        props.gameFilters.controls.forEach((control) => {
            const value = filters[control.key] ?? "";

            if (value !== "") {
                query[control.key] = value;
            }
        });
    }

    router.get("/profile", query, {
        only: ["gameShelves", "gameFilters"],
        preserveState: true,
        preserveScroll: true,
        replace: true,
    });
}

function isGameShelfTab(tab) {
    return ["owned", "wishlist", "favorites"].includes(tab);
}

function openProfileEvent(event) {
    selectedProfileEvent.value = event;
}

function closeProfileEvent() {
    selectedProfileEvent.value = null;
}
</script>

<template>
    <section
        id="profile-shortcuts-section"
        class="section-shell mt-12 scroll-mt-32"
    >
        <div class="space-y-0">
            <ProfileTabs
                :tabs="[
                    {
                        key: 'owned',
                        label: 'Mano turimi žaidimai',
                        icon: ownedGamesIconSrc,
                    },
                    {
                        key: 'wishlist',
                        label: 'Norų sąrašas',
                        icon: wishlistIconSrc,
                    },
                    {
                        key: 'favorites',
                        label: 'Mėgstamiausi žaidimai',
                        icon: heartIconSrc,
                    },
                    {
                        key: 'events',
                        label: 'Mano renginiai',
                        icon: eventsIconSrc,
                    },
                    { key: 'faq', label: 'D.U.K', icon: faqIconSrc },
                ]"
                :active-tab="activeTab()"
                @update:active-tab="selectProfileTab"
            />

            <div
                class="rounded-b-4xl rounded-t-none bg-mg-neutral p-6 shadow-md sm:p-8"
            >
                <div v-if="activeTab() === 'owned'">
                    <ProfileGameShelfPanel
                        :game-shelf="props.gameShelves.owned"
                        :filter-panel-open="isFilterPanelOpen"
                        :filter-controls="activeGameFilterControls()"
                        shelf-type="owned"
                        empty-message="Mano turimų žaidimų sąrašas yra tuščias"
                        @toggle-filter-panel="toggleActiveShelfFilterPanel"
                        @update-filter="updateActiveGameFilter"
                    />
                </div>

                <div v-else-if="activeTab() === 'wishlist'">
                    <ProfileGameShelfPanel
                        :game-shelf="props.gameShelves.wishlist"
                        :filter-panel-open="isFilterPanelOpen"
                        :filter-controls="activeGameFilterControls()"
                        shelf-type="wishlist"
                        empty-message="Norų sąrašas yra tuščias"
                        @toggle-filter-panel="toggleActiveShelfFilterPanel"
                        @update-filter="updateActiveGameFilter"
                    />
                </div>

                <div v-else-if="activeTab() === 'favorites'">
                    <ProfileGameShelfPanel
                        :game-shelf="props.gameShelves.favorites"
                        :filter-panel-open="isFilterPanelOpen"
                        :filter-controls="activeGameFilterControls()"
                        shelf-type="favorite"
                        empty-message="Nėra mėgstamiausių žaidimų"
                        @toggle-filter-panel="toggleActiveShelfFilterPanel"
                        @update-filter="updateActiveGameFilter"
                    />
                </div>

                <div v-else-if="activeTab() === 'events'">
                    <ProfileEventsPanel
                        :registered-event-sections="
                            props.registeredEventSections
                        "
                        @open-event="openProfileEvent"
                    />
                </div>

                <ProfileFaqPanel v-else />
            </div>
        </div>

        <EventRegistrationModal
            v-if="selectedProfileEvent"
            :event="selectedProfileEvent"
            @close="closeProfileEvent"
        />
    </section>
</template>
