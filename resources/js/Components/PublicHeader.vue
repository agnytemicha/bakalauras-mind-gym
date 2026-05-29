<script setup>
import { Link, router, usePage } from "@inertiajs/vue3";
import { onBeforeUnmount, onMounted, ref, watch } from "vue";
import { route } from "ziggy-js";
import PublicHeaderAccountMenu from "./PublicHeaderAccountMenu.vue";
import PublicHeaderIconButton from "./PublicHeaderIconButton.vue";
import PublicHeaderMobileMenu from "./PublicHeaderMobileMenu.vue";
import PublicHeaderNavLinks from "./PublicHeaderNavLinks.vue";
import PublicHeaderSearchPopover from "./PublicHeaderSearchPopover.vue";
import PublicHeaderShortcuts from "./PublicHeaderShortcuts.vue";
import { usePublicHeaderSearch } from "../composables/usePublicHeaderSearch";
import favoriteIconSrc from "@icons/actions/heart.svg";
import menuIconSrc from "@icons/actions/menu.svg";
import searchIconSrc from "@icons/actions/search.svg";
import ownedGamesIconSrc from "@icons/profile/games.svg";
import wishlistIconSrc from "@icons/profile/wishlist.svg";
import logoSrc from "@images/brand/logo.svg";

const emit = defineEmits(["open-login", "open-register"]);

const page = usePage();

const isMobileMenuOpen = ref(false);
const isUserMenuOpen = ref(false);
const searchAnchorX = ref(null);
const desktopUserMenuRef = ref(null);
const mobileUserMenuRef = ref(null);
const {
    isSearchOpen,
    isSearchLoading,
    searchQuery,
    searchError,
    searchPopoverRef,
    searchSections,
    openSearch,
    closeSearch,
    stopPendingSearch,
} = usePublicHeaderSearch();

function closeMenus(options = {}) {
    const { search = true } = options;

    isMobileMenuOpen.value = false;
    isUserMenuOpen.value = false;

    if (search) {
        closeSearch();
    }
}

function toggleMobileMenu() {
    isMobileMenuOpen.value = !isMobileMenuOpen.value;

    if (isMobileMenuOpen.value) {
        isUserMenuOpen.value = false;
        closeSearch();
    }
}

function toggleUserMenu() {
    isUserMenuOpen.value = !isUserMenuOpen.value;

    if (isUserMenuOpen.value) {
        isMobileMenuOpen.value = false;
        closeSearch();
    }
}

function updateSearchAnchor(event) {
    const button = event?.currentTarget;

    if (!button) {
        return;
    }

    const rect = button.getBoundingClientRect();
    searchAnchorX.value = rect.left + rect.width / 2;
}

function toggleSearch(event) {
    updateSearchAnchor(event);

    if (isSearchOpen.value) {
        closeSearch();
        return;
    }

    closeMenus({ search: false });
    openSearch();
}

function logout() {
    closeMenus();
    router.post(route("auth.logout", {}, false));
}

function openLogin() {
    emit("open-login");
    closeMenus();
}

function openRegister() {
    emit("open-register");
    closeMenus();
}

function handleHeaderShortcut(item) {
    closeMenus();

    if (activateCurrentProfileShortcut(item)) {
        return;
    }

    const currentPath = page.url.split("?")[0] || "/";

    router.visit(item.href, {
        preserveState: currentPath === "/profile",
    });
}

function activateCurrentProfileShortcut(item) {
    const currentPath = page.url.split("?")[0] || "/";

    if (currentPath !== "/profile" || page.url !== item.href) {
        return false;
    }

    if (item.tab && typeof window !== "undefined") {
        window.dispatchEvent(
            new CustomEvent("profile-shortcut-activate", {
                detail: { tab: item.tab },
            }),
        );
    }

    return true;
}

function handleDocumentClick(event) {
    if (
        isUserMenuOpen.value &&
        !desktopUserMenuRef.value?.contains(event.target) &&
        !mobileUserMenuRef.value?.contains(event.target)
    ) {
        isUserMenuOpen.value = false;
    }

    if (isSearchOpen.value && !searchPopoverRef.value?.contains(event.target)) {
        closeSearch();
    }
}

watch(
    () => page.props.auth.user,
    () => {
        closeMenus();
    },
);

watch(
    () => page.url,
    () => {
        closeMenus();
    },
);

onMounted(() => {
    document.addEventListener("click", handleDocumentClick);
});

onBeforeUnmount(() => {
    document.removeEventListener("click", handleDocumentClick);

    stopPendingSearch();
});
</script>

<template>
    <header class="sticky top-0 z-30 bg-mg-blue">
        <div
            class="mx-auto flex w-full max-w-440 flex-col py-3 sm:px-6 lg:px-8"
            :class="page.props.auth.user ? 'px-3' : 'px-4'"
        >
            <div
                class="flex items-center justify-between"
                :class="page.props.auth.user ? 'gap-2' : 'gap-4'"
            >
                <Link
                    href="/"
                    class="flex shrink-0 items-center gap-2.5 outline-none sm:gap-3"
                    @click="closeMenus"
                >
                    <img
                        :src="logoSrc"
                        class="h-[2.85rem] w-auto shrink-0 sm:h-13 lg:h-[3.6rem]"
                    />
                    <span
                        class="hidden whitespace-nowrap font-display text-[40px] uppercase leading-none tracking-[0.04em] text-black sm:block"
                    >
                        MIND GYM
                    </span>
                </Link>

                <div class="hidden items-center gap-2 xl:flex">
                    <PublicHeaderIconButton
                        :icon-src="searchIconSrc"
                        :expanded="isSearchOpen"
                        stop-propagation
                        @click="toggleSearch"
                    />

                    <PublicHeaderNavLinks
                        class="flex items-center gap-2"
                        :items="page.props.navigation.main"
                        @select="closeMenus"
                    />

                    <PublicHeaderShortcuts
                        v-if="page.props.auth.user"
                        :items="[
                            {
                                href: '/profile?tab=owned',
                                tab: 'owned',
                                icon: ownedGamesIconSrc,
                                label: 'Mano turimi žaidimai',
                            },
                            {
                                href: '/profile?tab=wishlist',
                                tab: 'wishlist',
                                icon: wishlistIconSrc,
                                label: 'Norų sąrašas',
                            },
                            {
                                href: '/profile?tab=favorites',
                                tab: 'favorites',
                                icon: favoriteIconSrc,
                                label: 'Mėgstamiausi žaidimai',
                            },
                        ]"
                        @select="handleHeaderShortcut"
                    />

                    <PublicHeaderAccountMenu
                        ref="desktopUserMenuRef"
                        :auth-user="page.props.auth.user"
                        :account-navigation="
                            page.props.navigation.member.map((item) => ({
                                ...item,
                                tone: 'blue',
                            }))
                        "
                        :open="isUserMenuOpen"
                        menu-class="w-76"
                        @toggle="toggleUserMenu"
                        @close="closeMenus"
                        @login="openLogin"
                        @register="openRegister"
                        @logout="logout"
                    />
                </div>

                <div
                    class="flex items-center xl:hidden"
                    :class="page.props.auth.user ? 'gap-0.5' : 'gap-2'"
                >
                    <PublicHeaderIconButton
                        :icon-src="searchIconSrc"
                        :expanded="isSearchOpen"
                        :compact="Boolean(page.props.auth.user)"
                        stop-propagation
                        @click="toggleSearch"
                    />

                    <PublicHeaderShortcuts
                        v-if="page.props.auth.user"
                        :items="[
                            {
                                href: '/profile?tab=owned',
                                tab: 'owned',
                                icon: ownedGamesIconSrc,
                                label: 'Mano turimi žaidimai',
                            },
                            {
                                href: '/profile?tab=wishlist',
                                tab: 'wishlist',
                                icon: wishlistIconSrc,
                                label: 'Norų sąrašas',
                            },
                            {
                                href: '/profile?tab=favorites',
                                tab: 'favorites',
                                icon: favoriteIconSrc,
                                label: 'Mėgstamiausi žaidimai',
                            },
                        ]"
                        compact
                        @select="handleHeaderShortcut"
                    />

                    <PublicHeaderAccountMenu
                        ref="mobileUserMenuRef"
                        :auth-user="page.props.auth.user"
                        :account-navigation="
                            page.props.navigation.member.map((item) => ({
                                ...item,
                                tone: 'blue',
                            }))
                        "
                        :open="isUserMenuOpen"
                        compact
                        menu-class="w-72 max-w-[85vw] sm:w-76"
                        @toggle="toggleUserMenu"
                        @close="closeMenus"
                        @login="openLogin"
                        @register="openRegister"
                        @logout="logout"
                    />

                    <PublicHeaderIconButton
                        :expanded="isMobileMenuOpen"
                        :compact="Boolean(page.props.auth.user)"
                        @click="toggleMobileMenu"
                    >
                        <img
                            :src="menuIconSrc"
                            class="h-5 w-5 object-contain"
                            alt=""
                        />
                    </PublicHeaderIconButton>
                </div>
            </div>

            <PublicHeaderMobileMenu
                :open="isMobileMenuOpen"
                :items="page.props.navigation.main"
                @select="closeMenus"
            />
        </div>
    </header>

    <PublicHeaderSearchPopover
        ref="searchPopoverRef"
        v-model="searchQuery"
        :open="isSearchOpen"
        :loading="isSearchLoading"
        :error="searchError"
        :sections="searchSections"
        :anchor-x="searchAnchorX"
        @select="closeSearch"
    />
</template>
