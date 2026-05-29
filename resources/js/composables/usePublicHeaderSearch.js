import { nextTick, ref, watch } from "vue";

const MIN_SEARCH_LENGTH = 2;
const SEARCH_DEBOUNCE_MS = 250;

export function usePublicHeaderSearch() {
    const isSearchOpen = ref(false);
    const isSearchLoading = ref(false);
    const searchQuery = ref("");
    const searchError = ref("");
    const searchSections = ref([]);
    const searchPopoverRef = ref(null);

    let searchDebounceTimer = null;
    let searchAbortController = null;

    function stopPendingSearch() {
        if (searchDebounceTimer) {
            window.clearTimeout(searchDebounceTimer);
            searchDebounceTimer = null;
        }

        if (searchAbortController) {
            searchAbortController.abort();
            searchAbortController = null;
        }
    }

    function resetSearchResults() {
        searchSections.value = [];
        searchError.value = "";
    }

    function closeSearch() {
        isSearchOpen.value = false;
        isSearchLoading.value = false;
        searchQuery.value = "";
        stopPendingSearch();
        resetSearchResults();
    }

    async function openSearch() {
        isSearchOpen.value = true;
        await nextTick();
        searchPopoverRef.value?.focusInput();
    }

    function currentQuery() {
        return searchQuery.value.trim();
    }

    function isCurrentQuery(query) {
        return query === currentQuery();
    }

    async function performSearch(query) {
        stopPendingSearch();

        const controller = new AbortController();
        searchAbortController = controller;

        try {
            const response = await fetch(
                `/search?query=${encodeURIComponent(query)}`,
                {
                    headers: {
                        Accept: "application/json",
                    },
                    signal: controller.signal,
                },
            );

            if (!response.ok) {
                throw new Error("Search request failed.");
            }

            const data = await response.json();

            if (!isCurrentQuery(query)) {
                return;
            }

            searchSections.value = data.sections;
            searchError.value = "";
        } catch (error) {
            if (error?.name === "AbortError") {
                return;
            }

            if (!isCurrentQuery(query)) {
                return;
            }

            resetSearchResults();
            searchError.value = "Nepavyko įkelti paieškos rezultatų.";
        } finally {
            if (searchAbortController === controller) {
                searchAbortController = null;
            }

            if (isCurrentQuery(query)) {
                isSearchLoading.value = false;
            }
        }
    }

    function queueSearch() {
        const query = currentQuery();

        stopPendingSearch();

        if (!isSearchOpen.value || query.length < MIN_SEARCH_LENGTH) {
            isSearchLoading.value = false;
            resetSearchResults();
            return;
        }

        isSearchLoading.value = true;
        searchError.value = "";
        searchDebounceTimer = window.setTimeout(() => {
            performSearch(query);
        }, SEARCH_DEBOUNCE_MS);
    }

    watch(searchQuery, () => {
        queueSearch();
    });

    return {
        isSearchOpen,
        isSearchLoading,
        searchQuery,
        searchError,
        searchPopoverRef,
        searchSections,
        openSearch,
        closeSearch,
        stopPendingSearch,
    };
}
