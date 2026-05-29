<script setup>
import { Head, router } from "@inertiajs/vue3";
import { ref } from "vue";
import { route } from "ziggy-js";
import ContactMessageCard from "../../../Components/Admin/ContactMessageCard.vue";
import CModal from "../../../Components/UI/CModal.vue";
import CMSLayout from "../../../Layouts/CMSLayout.vue";

defineOptions({ layout: CMSLayout });

defineProps(["messages"]);

const selectedMessage = ref(null);

function destroyMessage(message) {
    if (!window.confirm(message.deleteConfirmation)) {
        return;
    }

    if (selectedMessage.value?.id === message.id) {
        selectedMessage.value = null;
    }

    router.delete(route("admin.contact-messages.destroy", message.id, false), {
        preserveScroll: true,
    });
}
</script>

<template>
    <Head title="Kontaktinės žinutės" />

    <div class="px-6 py-8 sm:px-8 sm:py-10">
        <h1
            class="font-display text-[42px] uppercase leading-none text-black sm:text-[56px]"
        >
            Kontaktinės žinutės
        </h1>

        <section class="mt-8">
            <div v-if="messages.length" class="space-y-5">
                <ContactMessageCard
                    v-for="message in messages"
                    :key="message.id"
                    :message="message"
                    @open="selectedMessage = $event"
                    @delete="destroyMessage"
                />
            </div>

            <div
                v-else
                class="rounded-2xl border border-mg-border-gray bg-white p-8 text-center shadow-md"
            >
                <h2
                    class="font-display text-[32px] leading-none text-black sm:text-[40px]"
                >
                    Žinučių dar nėra
                </h2>
                <p
                    class="mt-3 font-sans text-lg font-semibold leading-7 text-mg-text-gray"
                >
                    Kai lankytojai parašys per „Susisiekime su mumis“, jų
                    žinutės atsiras čia.
                </p>
            </div>
        </section>
    </div>

    <CModal
        :open="Boolean(selectedMessage)"
        max-width-class="max-w-5xl"
        panel-class="max-h-[calc(100vh-5rem)] overflow-y-auto !bg-transparent !p-0 !shadow-none"
        :show-close-button="false"
        @close="selectedMessage = null"
    >
        <template v-if="selectedMessage" #default>
            <ContactMessageCard
                :message="selectedMessage"
                expanded
                @delete="destroyMessage"
            />
        </template>
    </CModal>
</template>
