<script setup>
defineProps(["text"]);
</script>

<template>
    <span class="group relative inline-flex shrink-0">
        <button
            type="button"
            class="inline-flex h-5 w-5 shrink-0 items-center justify-center rounded-full border border-mg-border-gray bg-white font-sans text-[0.78rem] font-semibold leading-none text-mg-border-gray transition duration-200 hover:border-black hover:text-black"
        >
            <span>?</span>
        </button>
        <span
            class="pointer-events-none absolute left-1/2 top-[calc(100%+0.5rem)] z-40 hidden w-max max-w-72 -translate-x-1/2 rounded-xl border border-mg-border-gray bg-white px-3 py-2 font-sans text-[0.85rem] font-medium leading-snug text-slate-900 shadow-md group-hover:block group-focus-within:block"
        >
            {{ text }}
        </span>
    </span>
</template>
