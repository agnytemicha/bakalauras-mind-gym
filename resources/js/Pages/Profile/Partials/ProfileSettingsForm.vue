<script setup>
import CButton from "../../../Components/UI/CButton.vue";
import CTextInput from "../../../Components/UI/CTextInput.vue";

defineProps(["profile", "photoForm"]);

defineEmits([
    "open-email-modal",
    "open-password-modal",
    "open-photo-picker",
]);
</script>

<template>
    <div class="space-y-4">
        <div class="flex flex-col gap-2 sm:flex-row sm:items-center sm:gap-4">
            <label
                for="profile-email"
                class="shrink-0 font-sans text-base font-semibold leading-none text-black sm:w-46 lg:w-52"
            >
                El. paštas
            </label>
            <div
                class="flex min-w-0 flex-1 flex-col gap-3 sm:flex-row sm:items-center"
            >
                <CTextInput
                    id="profile-email"
                    :model-value="profile.email"
                    type="email"
                    autocomplete="email"
                    readonly
                    wrapper-class="min-w-0 flex-1"
                />

                <CButton variant="accent" @click="$emit('open-email-modal')">
                    Pakeisti el. paštą
                </CButton>
            </div>
        </div>

        <div class="space-y-6 pt-4 sm:pl-50 lg:pl-56">
            <div>
                <CButton variant="accent" @click="$emit('open-password-modal')">
                    Pakeisti slaptažodį
                </CButton>
            </div>

            <div class="space-y-2">
                <CButton
                    variant="accent"
                    :disabled="photoForm.processing"
                    @click="$emit('open-photo-picker')"
                >
                    {{ profile.photoButtonLabel }}
                </CButton>

                <p
                    v-if="photoForm.errors.photo"
                    class="text-sm font-semibold text-mg-red"
                >
                    {{ photoForm.errors.photo }}
                </p>
            </div>
        </div>
    </div>
</template>
