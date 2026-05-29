<script setup>
import { useForm } from "@inertiajs/vue3";
import { route } from "ziggy-js";
import CButton from "../UI/CButton.vue";
import CTextInput from "../UI/CTextInput.vue";

const emit = defineEmits(["success"]);

const form = useForm({
    email: "",
    password: "",
});

function submit() {
    form.post(route("auth.login", {}, false), {
        preserveScroll: true,
        errorBag: "login",
        onSuccess: () => emit("success"),
    });
}
</script>

<template>
    <form class="mt-8 grid gap-4" @submit.prevent="submit">
        <CTextInput
            v-model="form.email"
            type="email"
            label="El. paštas"
            :error="form.errors.email"
        />

        <CTextInput
            v-model="form.password"
            type="password"
            label="Slaptažodis"
            :error="form.errors.password || form.errors.login"
        />

        <div class="mt-2 flex flex-wrap justify-center gap-3">
            <CButton type="submit" variant="danger" :disabled="form.processing">
                Prisijungti
            </CButton>
        </div>
    </form>
</template>
