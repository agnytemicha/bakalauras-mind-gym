<script setup>
import { Link, usePage } from "@inertiajs/vue3";
import { route } from "ziggy-js";

defineProps(["mobileSidebarOpen"]);

defineEmits(["close-sidebar"]);

const page = usePage();
</script>

<template>
    <button
        v-if="mobileSidebarOpen"
        type="button"
        class="fixed inset-0 top-[3.35rem] z-30 bg-black/28 sm:top-[3.9rem] lg:hidden"
        @click="$emit('close-sidebar')"
    />

    <aside
        class="fixed left-0 top-[3.35rem] z-[35] flex h-[calc(100vh-3.35rem)] w-[min(20rem,88vw)] flex-col overflow-y-auto bg-white px-6 py-6 shadow-md transition-transform duration-200 sm:top-[3.9rem] sm:h-[calc(100vh-3.9rem)] lg:static lg:z-auto lg:h-auto lg:w-auto lg:translate-x-0 lg:shadow-none lg:min-h-[calc(100vh-4.35rem)]"
        :class="
            mobileSidebarOpen
                ? 'translate-x-0'
                : '-translate-x-full lg:translate-x-0'
        "
    >
        <div>
            <p class="text-[2rem] font-semibold leading-tight text-slate-950">
                {{ page.props.cmsAuth.user.name }}
            </p>
            <p
                class="mt-2 font-sans text-base font-semibold text-mg-text-gray"
            >
                {{ page.props.cmsAuth.user.roleLabel }}
            </p>
        </div>

        <div class="mt-8 grid auto-rows-max content-start gap-2">
            <div class="rounded-2xl bg-mg-blue px-4 py-3 shadow-md">
                <Link
                    :href="route('admin.games.index', {}, false)"
                    class="flex w-full items-center justify-between gap-3 rounded-xl font-sans text-left text-[1.02rem] font-bold text-black transition duration-200 hover:-translate-y-0.5 focus:outline-none focus:ring-2 focus:ring-black/10"
                    @click="$emit('close-sidebar')"
                >
                    <span>Stalo žaidimai</span>
                </Link>
            </div>

            <div class="rounded-2xl bg-mg-yellow px-4 py-3 shadow-md">
                <Link
                    :href="route('admin.events.index', {}, false)"
                    class="flex w-full items-center justify-between gap-3 rounded-xl font-sans text-left text-[1.02rem] font-bold text-black transition duration-200 hover:-translate-y-0.5 focus:outline-none focus:ring-2 focus:ring-black/10"
                    @click="$emit('close-sidebar')"
                >
                    <span>Renginiai</span>
                </Link>
            </div>

            <div class="rounded-2xl bg-mg-red px-4 py-3 shadow-md">
                <Link
                    :href="route('admin.articles.index', {}, false)"
                    class="flex w-full items-center justify-between gap-3 rounded-xl font-sans text-left text-[1.02rem] font-bold text-black transition duration-200 hover:-translate-y-0.5 focus:outline-none focus:ring-2 focus:ring-black/10"
                    @click="$emit('close-sidebar')"
                >
                    <span>Tinklaraštis</span>
                </Link>
            </div>

            <div class="rounded-2xl bg-mg-blue px-4 py-3 shadow-md">
                <Link
                    :href="route('admin.contact-messages.index', {}, false)"
                    class="flex w-full items-center justify-between gap-3 rounded-xl font-sans text-left text-[1.02rem] font-bold text-black transition duration-200 hover:-translate-y-0.5 focus:outline-none focus:ring-2 focus:ring-black/10"
                    @click="$emit('close-sidebar')"
                >
                    <span>Kontaktinės žinutės</span>
                </Link>
            </div>
        </div>
    </aside>
</template>
