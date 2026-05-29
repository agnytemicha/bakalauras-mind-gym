<script setup>
import { computed, ref, watch } from "vue";
import CModal from "../UI/CModal.vue";
import LoginForm from "./LoginForm.vue";
import RegisterForm from "./RegisterForm.vue";

const props = defineProps({
    open: {
        type: Boolean,
        default: false,
    },
    initialMode: {
        type: String,
        default: "login",
    },
});

const emit = defineEmits(["close"]);

const mode = ref(resolveMode(props.initialMode));

const isLogin = computed(() => mode.value === "login");
const title = computed(() =>
    isLogin.value ? "Prisijungimas" : "Registracija",
);
const description = computed(() =>
    isLogin.value
        ? "Prisijungę galėsite kaupti žaidimus, registruotis į renginius, rašyti komentarus bei atsiliepimus."
        : "Susikurkite paskyrą, kad galėtumėte kaupti žaidimus, registruotis į renginius, rašyti komentarus, bei atsiliepimus.",
);
const switchLabel = computed(() =>
    isLogin.value ? "Registracija" : "Jau turiu paskyrą.",
);

watch(
    () => props.initialMode,
    (value) => {
        mode.value = resolveMode(value);
    },
);

watch(
    () => props.open,
    (value) => {
        if (value) {
            mode.value = resolveMode(props.initialMode);
        }
    },
);

function resolveMode(value) {
    return value === "register" ? "register" : "login";
}

function closeModal() {
    emit("close");
}

function switchMode() {
    mode.value = isLogin.value ? "register" : "login";
}
</script>

<template>
    <CModal
        :open="open"
        :title="title"
        heading=""
        :description="description"
        max-width-class="max-w-2xl"
        @close="closeModal"
    >
        <template #default>
            <LoginForm v-show="mode === 'login'" @success="closeModal" />

            <RegisterForm v-show="mode === 'register'" @success="closeModal" />
        </template>

        <template #actions>
            <div class="flex w-full justify-center">
                <button
                    type="button"
                    class="font-sans text-lg font-semibold leading-none text-black transition duration-200 hover:opacity-70"
                    @click="switchMode"
                >
                    {{ switchLabel }}
                </button>
            </div>
        </template>
    </CModal>
</template>
