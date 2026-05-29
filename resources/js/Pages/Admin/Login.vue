<script setup>
import { Head, useForm } from "@inertiajs/vue3";
import { route } from "ziggy-js";
import CButton from "../../Components/UI/CButton.vue";
import CTextInput from "../../Components/UI/CTextInput.vue";
import FlashToast from "../../Components/FlashToast.vue";
import logoSrc from "@images/brand/logo-with-title.svg";

const form = useForm({
    email: "",
    password: "",
});

function submit() {
    form.post(route("admin.authenticate", {}, false), {
        preserveScroll: true,
        onFinish: () => form.reset("password"),
    });
}
</script>

<template>
    <Head title="CMS prisijungimas" />

    <div class="min-h-screen bg-mg-panel-gray px-4 py-8 sm:px-6">
        <FlashToast />

        <div
            class="mx-auto flex min-h-[calc(100vh-4rem)] max-w-6xl items-center justify-center"
        >
            <section
                class="w-full max-w-xl rounded-3xl bg-white px-6 py-8 shadow-md sm:px-8 sm:py-10"
            >
                <div class="flex flex-col items-center text-center">
                    <img :src="logoSrc" class="h-auto w-full max-w-[250px]" />
                    <p
                        class="mt-8 font-display text-3xl uppercase text-black sm:text-4xl"
                    >
                        Prisijungti prie CMS
                    </p>
                </div>

                <form class="mt-8 grid gap-4" @submit.prevent="submit">
                    <CTextInput
                        v-model="form.email"
                        type="email"
                        label="El. paštas"
                        :error="form.errors.email"
                        autocomplete="email"
                    />

                    <CTextInput
                        v-model="form.password"
                        type="password"
                        label="Slaptažodis"
                        :error="form.errors.password"
                        autocomplete="current-password"
                    />

                    <div class="mt-2 flex flex-col items-center gap-3">
                        <CButton
                            type="submit"
                            variant="danger"
                            :loading="form.processing"
                            loading-label="Jungiamasi..."
                        >
                            Prisijungti
                        </CButton>

                        <CButton
                            :href="route('home', {}, false)"
                            variant="secondary"
                        >
                            Grįžti į svetainę
                        </CButton>
                    </div>
                </form>
            </section>
        </div>
    </div>
</template>
