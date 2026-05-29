<script setup>
import { useForm } from "@inertiajs/vue3";
import { route } from "ziggy-js";
import CButton from "../UI/CButton.vue";
import CTextInput from "../UI/CTextInput.vue";

const emit = defineEmits(["success"]);

const form = useForm({
    name: "",
    username: "",
    birth_date: "",
    email: "",
    password: "",
    password_confirmation: "",
});

function submit() {
    form.post(route("auth.register", {}, false), {
        preserveScroll: true,
        errorBag: "register",
        onSuccess: () => emit("success"),
    });
}
</script>

<template>
    <form class="mt-8 grid gap-4" @submit.prevent="submit">
        <div class="grid gap-4 sm:grid-cols-2">
            <CTextInput
                v-model="form.name"
                label="Vardas"
                :error="form.errors.name"
            />

            <CTextInput
                v-model="form.username"
                label="Slapyvardis"
                :error="form.errors.username"
            />
        </div>

        <div class="grid gap-4 sm:grid-cols-[1fr_160px]">
            <CTextInput
                v-model="form.email"
                type="email"
                label="El. paštas"
                :error="form.errors.email"
            />

            <CTextInput
                v-model="form.birth_date"
                type="date"
                label="Gimimo data"
                autocomplete="bday"
                :error="form.errors.birth_date"
            />
        </div>

        <div class="grid gap-4 sm:grid-cols-2">
            <CTextInput
                v-model="form.password"
                type="password"
                label="Slaptažodis"
                :error="form.errors.password"
            />

            <CTextInput
                v-model="form.password_confirmation"
                type="password"
                label="Pakartokite slaptažodį"
            />
        </div>

        <div class="mt-2 flex flex-wrap justify-center gap-3">
            <CButton type="submit" variant="danger" :disabled="form.processing">
                Registruotis
            </CButton>
        </div>
    </form>
</template>
