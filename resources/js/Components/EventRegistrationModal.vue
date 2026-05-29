<script setup>
import { router } from "@inertiajs/vue3";
import { inject } from "vue";
import { route } from "ziggy-js";
import CButton from "./UI/CButton.vue";
import CModal from "./UI/CModal.vue";
import availableIconSrc from "@icons/events/available.svg";
import fullIconSrc from "@icons/events/full.svg";
import placeIconSrc from "@icons/events/place.svg";

const { event } = defineProps(["event"]);

const emit = defineEmits(["close"]);

const openAuthModal = inject("openAuthModal", () => {});

function closeModal() {
    emit("close");
}

function handlePrimaryAction() {
    const action = event.registrationAction;

    if (!action.enabled) {
        return;
    }

    if (action.type === "login") {
        closeModal();
        openAuthModal("login");
        return;
    }

    let method = "post";
    let url = route("events.register", event.slug, false);

    if (action.type === "cancel") {
        method = "delete";
        url = route("events.unregister", event.slug, false);
    }

    router.visit(url, {
        method,
        preserveScroll: true,
        onSuccess: closeModal,
    });
}
</script>

<template>
    <CModal
        :open="true"
        :title="event.title"
        max-width-class="max-w-2xl"
        panel-class="max-h-[calc(100vh-3rem)] overflow-y-auto sm:max-h-[calc(100vh-4rem)]"
        @close="closeModal"
    >
        <template #default>
            <div class="rounded-2xl bg-white/55 p-5">
                <p
                    class="font-sans text-xl font-bold leading-[1.2] text-black"
                >
                    {{ event.startsAtLabel }}
                </p>

                <p
                    class="mt-4 text-justify font-sans text-lg font-semibold leading-[1.28] text-black"
                >
                    {{ event.description }}
                </p>
                <p
                    class="mt-4 flex items-center gap-2 font-sans text-base font-semibold leading-[1.28] text-black"
                >
                    <img :src="placeIconSrc" class="h-4 w-4 object-contain" />
                    <span>{{ event.location }}</span>
                </p>
                <p
                    class="mt-4 flex items-center gap-2 font-sans text-base font-semibold leading-[1.28] text-black"
                >
                    <img
                        :src="
                            event.seatsState === 'available'
                                ? availableIconSrc
                                : fullIconSrc
                        "
                        class="h-4 w-4 object-contain"
                    />
                    <span>{{ event.seatsLabel }}</span>
                </p>
            </div>

            <p
                class="mt-4 font-sans text-base font-semibold italic leading-[1.28] text-black"
            >
                Patvirtinkite dalyvavimą ir rezervuokite vietą į šį renginį.
            </p>
        </template>

        <template #actions>
            <CButton
                :variant="event.registrationAction.variant"
                :disabled="!event.registrationAction.enabled"
                @click="handlePrimaryAction"
            >
                {{ event.registrationAction.label }}
            </CButton>
        </template>
    </CModal>
</template>
