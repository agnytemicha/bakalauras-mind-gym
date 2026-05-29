<script setup>
import { usePage } from "@inertiajs/vue3";
import { computed, provide, ref, watch } from "vue";
import LoginRegisterModal from "../Components/Auth/LoginRegisterModal.vue";
import FlashToast from "../Components/FlashToast.vue";
import PublicHeader from "../Components/PublicHeader.vue";
import PublicInfoFooter from "../Components/PublicInfoFooter.vue";

const page = usePage();

const isAuthModalOpen = ref(false);
const authMode = ref("login");
const authUser = computed(() => page.props.auth.user);

function openAuthModal(mode = "login") {
    authMode.value = mode;
    isAuthModalOpen.value = true;
}

function closeAuthModal() {
    isAuthModalOpen.value = false;
}

provide("openAuthModal", openAuthModal);

watch(
    () => authUser.value,
    (user) => {
        if (user) {
            isAuthModalOpen.value = false;
        }
    },
);
</script>

<template>
    <div class="relative min-h-screen">
        <FlashToast />

        <PublicHeader
            @open-login="openAuthModal('login')"
            @open-register="openAuthModal('register')"
        />

        <main class="relative z-10">
            <slot />
        </main>

        <PublicInfoFooter class="mt-20" />

        <LoginRegisterModal
            :open="isAuthModalOpen"
            :initial-mode="authMode"
            @close="closeAuthModal"
        />
    </div>
</template>
