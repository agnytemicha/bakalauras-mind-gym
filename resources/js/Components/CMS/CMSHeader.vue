<script setup>
import { Link } from "@inertiajs/vue3";
import { route } from "ziggy-js";
import logoSrc from "@images/brand/logo-with-title.svg";
import menuIconSrc from "@icons/actions/menu.svg";
import CButton from "../UI/CButton.vue";

defineEmits(["toggle-sidebar", "logout"]);
</script>

<template>
    <header
        class="sticky top-0 z-30 bg-mg-blue shadow-md"
    >
        <div
            class="flex w-full items-center justify-between gap-4 px-4 py-2 sm:px-6"
        >
            <div class="flex items-center gap-3">
                <button
                    type="button"
                    class="inline-flex h-10 w-10 items-center justify-center rounded-xl bg-white/80 text-black shadow-md transition duration-200 hover:-translate-y-0.5 lg:hidden"
                    @click="$emit('toggle-sidebar')"
                >
                    <img
                        :src="menuIconSrc"
                        class="h-5 w-5 object-contain"
                        alt=""
                    />
                </button>

                <Link
                    :href="route('admin.games.index', {}, false)"
                    class="shrink-0"
                >
                    <img
                        :src="logoSrc"
                        class="h-[2.35rem] w-auto sm:h-[2.9rem] lg:h-[3.35rem]"
                    />
                </Link>
            </div>

            <CButton variant="danger" @click="$emit('logout')">
                Atsijungti
            </CButton>
        </div>
    </header>
</template>
