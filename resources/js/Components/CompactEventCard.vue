<script setup>
import placeIconSrc from "@icons/events/place.svg";

defineOptions({
    name: "CompactEventCard",
});

defineProps(["event"]);
</script>

<template>
    <article
        class="h-full rounded-4xl bg-mg-yellow px-5 py-5 shadow-md"
    >
        <p
            class="text-xs font-black uppercase tracking-[0.22em] text-[#6f5f42]"
        >
            {{ event.startsAtLabel }}
        </p>
        <h2
            class="mt-3 font-display text-2xl uppercase leading-none text-black"
        >
            {{ event.title }}
        </h2>
        <p
            class="mt-3 overflow-hidden text-sm leading-7 text-[#5f533f] [display:-webkit-box] [-webkit-box-orient:vertical] [-webkit-line-clamp:3]"
        >
            {{ event.description }}
        </p>
        <p
            class="mt-4 flex items-center gap-2 text-sm font-semibold text-[#5f533f]"
        >
            <img :src="placeIconSrc" class="h-4 w-4 object-contain" />
            <span>{{ event.location }}</span>
        </p>
    </article>
</template>
