<script setup>
import CButton from "../../../Components/UI/CButton.vue";
import CTextInput from "../../../Components/UI/CTextInput.vue";

defineProps(["profileForm"]);

defineEmits(["submit"]);
</script>

<template>
    <form class="space-y-4" @submit.prevent="$emit('submit')">
        <div class="flex flex-col gap-2 sm:flex-row sm:items-center sm:gap-4">
            <label
                for="profile-name"
                class="shrink-0 font-sans text-base font-semibold leading-none text-black sm:w-46 lg:w-52"
            >
                Vardas
            </label>
            <CTextInput
                id="profile-name"
                v-model="profileForm.name"
                :error="profileForm.errors.name"
                wrapper-class="min-w-0 flex-1"
            />
        </div>

        <div class="flex flex-col gap-2 sm:flex-row sm:items-center sm:gap-4">
            <label
                for="profile-last-name"
                class="shrink-0 font-sans text-base font-semibold leading-none text-black sm:w-46 lg:w-52"
            >
                Pavardė
            </label>
            <CTextInput
                id="profile-last-name"
                v-model="profileForm.last_name"
                :error="profileForm.errors.last_name"
                wrapper-class="min-w-0 flex-1"
            />
        </div>

        <div class="flex flex-col gap-2 sm:flex-row sm:items-center sm:gap-4">
            <label
                for="profile-birth-date"
                class="shrink-0 font-sans text-base font-semibold leading-none text-black sm:w-46 lg:w-52"
            >
                Gimimo data
            </label>
            <CTextInput
                id="profile-birth-date"
                v-model="profileForm.birth_date"
                type="date"
                :error="profileForm.errors.birth_date"
                wrapper-class="min-w-0 flex-1"
            />
        </div>

        <div class="flex flex-col gap-2 sm:flex-row sm:items-center sm:gap-4">
            <label
                for="profile-username"
                class="shrink-0 font-sans text-base font-semibold leading-none text-black sm:w-46 lg:w-52"
            >
                Slapyvardis
            </label>
            <CTextInput
                id="profile-username"
                v-model="profileForm.username"
                :error="profileForm.errors.username"
                wrapper-class="min-w-0 flex-1"
            />
        </div>

        <div class="space-y-3 sm:pl-50 lg:pl-56">
            <CButton
                type="submit"
                variant="primary"
                :disabled="profileForm.processing"
            >
                Išsaugoti
            </CButton>
        </div>
    </form>
</template>
