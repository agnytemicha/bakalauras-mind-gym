<script setup>
import { useForm } from "@inertiajs/vue3";
import { ref } from "vue";
import CButton from "../../../Components/UI/CButton.vue";
import CModal from "../../../Components/UI/CModal.vue";
import CTextInput from "../../../Components/UI/CTextInput.vue";
import noPhotoIconSrc from "@icons/content/no-photo.svg";
import profileInformationIconSrc from "@icons/profile/information.svg";
import newsletterIconSrc from "@icons/profile/newsletter.svg";
import settingsIconSrc from "@icons/profile/settings.svg";
import ProfileInfoForm from "./ProfileInfoForm.vue";
import ProfileNewsPreferencesForm from "./ProfileNewsPreferencesForm.vue";
import ProfileSettingsForm from "./ProfileSettingsForm.vue";
import ProfileTabs from "./ProfileTabs.vue";

const { profile } = defineProps(["profile"]);

const activeProfileTab = ref("info");
const activeCredentialModal = ref(null);
const photoInputRef = ref(null);

const profileForm = useForm({
    name: profile.name,
    last_name: profile.lastName,
    username: profile.username,
    birth_date: profile.birthDate,
});

const emailForm = useForm({
    email: profile.email,
});

const passwordForm = useForm({
    current_password: "",
    password: "",
    password_confirmation: "",
});

const photoForm = useForm({
    photo: null,
});

const newsPreferencesForm = useForm({
    ...profile.newsPreferences,
});

function openPhotoPicker() {
    photoInputRef.value?.click();
}

function updateProfileTab(tab) {
    activeProfileTab.value = tab;
}

function updateProfile() {
    profileForm.put("/profile", {
        preserveScroll: true,
        onSuccess: () => {
            profileForm.defaults({
                ...profileForm.data(),
            });
        },
    });
}

function submitPhoto(event) {
    const input = event.target;
    const file = input.files?.[0];

    if (!file) {
        return;
    }

    photoForm.photo = file;

    photoForm.post("/profile/photo", {
        preserveScroll: true,
        forceFormData: true,
        onSuccess: () => {
            photoForm.reset();
        },
        onFinish: () => {
            photoForm.photo = null;

            if (input) {
                input.value = "";
            }
        },
    });
}

function openEmailModal() {
    openCredentialModal("email", emailForm, true);
}

function closeEmailModal() {
    closeCredentialModal(emailForm);
}

function updateEmail() {
    emailForm.put("/profile/email", {
        preserveScroll: true,
        onSuccess: () => {
            emailForm.defaults({
                email: emailForm.email,
            });
            closeEmailModal();
        },
        onError: () => {
            activeCredentialModal.value = "email";
        },
    });
}

function openPasswordModal() {
    openCredentialModal("password", passwordForm);
}

function closePasswordModal() {
    closeCredentialModal(passwordForm);
}

function updatePassword() {
    passwordForm.put("/profile/password", {
        preserveScroll: true,
        onSuccess: () => {
            closePasswordModal();
        },
        onError: () => {
            activeCredentialModal.value = "password";
        },
    });
}

function updateNewsPreference(key, value) {
    const oldValue = Boolean(newsPreferencesForm[key]);

    newsPreferencesForm.clearErrors();
    newsPreferencesForm[key] = Boolean(value);

    newsPreferencesForm.put("/profile/newsletter", {
        preserveScroll: true,
        preserveState: true,
        onError: () => {
            newsPreferencesForm[key] = oldValue;
        },
    });
}

function openCredentialModal(modal, form, reset = false) {
    form.clearErrors();

    if (reset) {
        form.reset();
    }

    activeCredentialModal.value = modal;
}

function closeCredentialModal(form) {
    activeCredentialModal.value = null;
    form.reset();
    form.clearErrors();
}
</script>

<template>
    <section class="section-shell pt-8">
        <div
            class="grid gap-8 lg:grid-cols-[15.5rem_minmax(0,1fr)] lg:items-start xl:gap-12"
        >
            <div class="flex flex-col items-center gap-6">
                <h1
                    class="w-full max-w-62 text-center font-display text-[32px] uppercase leading-none text-black"
                >
                    Mano profilis
                </h1>

                <div class="flex flex-col items-center">
                    <div
                        class="flex aspect-square w-full max-w-62 items-center justify-center overflow-hidden rounded-4xl bg-mg-panel-gray shadow-md"
                    >
                        <img
                            :src="profile.photoUrl || noPhotoIconSrc"
                            :class="
                                profile.hasPhoto
                                    ? 'h-full w-full object-cover'
                                    : 'h-[58%] w-[58%] object-contain'
                            "
                        />
                    </div>

                    <input
                        ref="photoInputRef"
                        type="file"
                        accept=".jpg,.jpeg,.png,.webp,image/jpeg,image/png,image/webp"
                        class="hidden"
                        @change="submitPhoto"
                    />
                </div>
            </div>

            <div class="min-w-0 lg:pt-0">
                <div class="space-y-0">
                    <ProfileTabs
                        :tabs="[
                            {
                                key: 'info',
                                label: 'Mano informacija',
                                icon: profileInformationIconSrc,
                            },
                            {
                                key: 'settings',
                                label: 'Nustatymai',
                                icon: settingsIconSrc,
                            },
                            {
                                key: 'news',
                                label: 'Naujienos',
                                icon: newsletterIconSrc,
                            },
                        ]"
                        :active-tab="activeProfileTab"
                        @update:active-tab="updateProfileTab"
                    />

                    <div
                        class="rounded-b-4xl rounded-t-none bg-mg-neutral p-6 shadow-md sm:p-8"
                    >
                        <ProfileInfoForm
                            v-if="activeProfileTab === 'info'"
                            :profile-form="profileForm"
                            @submit="updateProfile"
                        />

                        <ProfileSettingsForm
                            v-else-if="activeProfileTab === 'settings'"
                            :profile="profile"
                            :photo-form="photoForm"
                            @open-email-modal="openEmailModal"
                            @open-password-modal="openPasswordModal"
                            @open-photo-picker="openPhotoPicker"
                        />

                        <ProfileNewsPreferencesForm
                            v-else
                            :news-preferences-form="newsPreferencesForm"
                            @update-preference="updateNewsPreference"
                        />
                    </div>
                </div>
            </div>
        </div>

        <CModal
            :open="activeCredentialModal === 'email'"
            title="Pakeisti el. paštą"
            max-width-class="max-w-136"
            @close="closeEmailModal"
        >
            <template #default>
                <form
                    id="profile-email-form"
                    class="space-y-4"
                    @submit.prevent="updateEmail"
                >
                    <CTextInput
                        v-model="emailForm.email"
                        type="email"
                        label="Naujas el. paštas"
                        autocomplete="email"
                        :error="emailForm.errors.email"
                    />
                </form>
            </template>

            <template #actions>
                <div class="flex w-full justify-center">
                    <CButton
                        type="submit"
                        form="profile-email-form"
                        variant="accent"
                        :disabled="emailForm.processing"
                    >
                        Išsaugoti el. paštą
                    </CButton>
                </div>
            </template>
        </CModal>

        <CModal
            :open="activeCredentialModal === 'password'"
            title="Pakeisti slaptažodį"
            max-width-class="max-w-136"
            @close="closePasswordModal"
        >
            <template #default>
                <form
                    id="profile-password-form"
                    class="space-y-4"
                    @submit.prevent="updatePassword"
                >
                    <CTextInput
                        v-model="passwordForm.current_password"
                        type="password"
                        label="Dabartinis slaptažodis"
                        :error="passwordForm.errors.current_password"
                    />

                    <CTextInput
                        v-model="passwordForm.password"
                        type="password"
                        label="Naujas slaptažodis"
                        :error="passwordForm.errors.password"
                    />

                    <CTextInput
                        v-model="passwordForm.password_confirmation"
                        type="password"
                        label="Pakartokite naują slaptažodį"
                    />
                </form>
            </template>

            <template #actions>
                <div class="flex w-full justify-center">
                    <CButton
                        type="submit"
                        form="profile-password-form"
                        variant="accent"
                        :disabled="passwordForm.processing"
                    >
                        Išsaugoti slaptažodį
                    </CButton>
                </div>
            </template>
        </CModal>
    </section>
</template>
