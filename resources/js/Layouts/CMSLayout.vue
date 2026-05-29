<script setup>
import { router, usePage } from "@inertiajs/vue3";
import { ref, watch } from "vue";
import { route } from "ziggy-js";
import CMSHeader from "../Components/CMS/CMSHeader.vue";
import CMSSidebar from "../Components/CMS/CMSSidebar.vue";
import FlashToast from "../Components/FlashToast.vue";

const page = usePage();
const isMobileSidebarOpen = ref(false);

function toggleMobileSidebar() {
    isMobileSidebarOpen.value = !isMobileSidebarOpen.value;
}

function closeMobileSidebar() {
    isMobileSidebarOpen.value = false;
}

function logout() {
    closeMobileSidebar();
    router.post(route("admin.logout", {}, false));
}

watch(
    () => page.url,
    () => {
        closeMobileSidebar();
    },
);
</script>

<template>
    <div class="min-h-screen bg-mg-panel-gray">
        <FlashToast />

        <CMSHeader
            :mobile-sidebar-open="isMobileSidebarOpen"
            @toggle-sidebar="toggleMobileSidebar"
            @logout="logout"
        />

        <div
            class="relative grid lg:min-h-[calc(100vh-4.35rem)] lg:grid-cols-[320px_minmax(0,1fr)]"
        >
            <CMSSidebar
                :mobile-sidebar-open="isMobileSidebarOpen"
                @close-sidebar="closeMobileSidebar"
            />

            <div class="min-w-0 px-4 py-4 sm:px-6 sm:py-5 lg:px-6">
                <main
                    class="min-h-full rounded-3xl bg-white shadow-md"
                >
                    <slot />
                </main>
            </div>
        </div>
    </div>
</template>
