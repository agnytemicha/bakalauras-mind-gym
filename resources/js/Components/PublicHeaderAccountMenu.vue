<script setup>
import { computed, ref } from "vue";
import CButton from "./UI/CButton.vue";
import CNavButton from "./UI/CNavButton.vue";
import accountLoggedInIconSrc from "@icons/account/user-logged-in.svg";
import accountLoggedOutIconSrc from "@icons/account/user-logged-out.svg";

const props = defineProps({
    authUser: {
        type: Object,
        default: null,
    },
    accountNavigation: {
        type: Array,
        required: true,
    },
    open: {
        type: Boolean,
        default: false,
    },
    compact: {
        type: Boolean,
        default: false,
    },
    menuClass: {
        type: String,
        default: "w-76",
    },
});

const emit = defineEmits(["toggle", "close", "login", "register", "logout"]);

const rootRef = ref(null);

const accountIconSrc = computed(() =>
    props.authUser ? accountLoggedInIconSrc : accountLoggedOutIconSrc,
);

const accountPanelClass = computed(() => [
    props.menuClass,
    "rounded-3xl bg-white p-4 shadow-md",
]);

function contains(target) {
    return Boolean(rootRef.value?.contains(target));
}

defineExpose({ contains });
</script>

<template>
    <div ref="rootRef" class="relative">
        <button
            type="button"
            class="inline-flex h-10 w-10 items-center justify-center rounded-xl bg-transparent p-0 text-black transition duration-200 hover:-translate-y-0.5"
            :class="compact ? '!h-9 !w-9' : ''"
            @click.stop="emit('toggle')"
        >
            <img
                :src="accountIconSrc"
                class="block h-8 w-8 translate-y-px object-contain"
            />
        </button>

        <div
            v-if="open"
            class="absolute right-0 top-[calc(100%+0.9rem)] z-40"
            :class="accountPanelClass"
        >
            <template v-if="authUser">
                <div class="px-2 py-1">
                    <p
                        class="text-xl font-semibold leading-tight text-black"
                    >
                        {{ authUser.name }}
                    </p>
                    <p
                        class="mt-1 text-base leading-tight italic text-zinc-700"
                    >
                        @{{ authUser.username }}
                    </p>
                </div>

                <div class="mt-3 grid gap-2">
                    <CNavButton
                        v-for="item in accountNavigation"
                        :key="item.href"
                        :href="item.href"
                        :tone="item.tone"
                        full-width
                        @click="emit('close')"
                    >
                        {{ item.label }}
                    </CNavButton>
                </div>

                <div class="mt-3">
                    <CButton
                        variant="danger"
                        block
                        class="!min-h-10 !rounded-xl !px-4 !py-2 !font-sans !text-[0.97rem] !font-bold !shadow-md"
                        @click="emit('logout')"
                    >
                        Atsijungti
                    </CButton>
                </div>
            </template>

            <template v-else>
                <div class="grid gap-2">
                    <CButton variant="primary" block @click="emit('login')">
                        Prisijungti
                    </CButton>
                    <CButton variant="danger" block @click="emit('register')">
                        Registruotis
                    </CButton>
                </div>
            </template>
        </div>
    </div>
</template>
