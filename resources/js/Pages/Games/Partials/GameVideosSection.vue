<script setup>
import SmallVideoCard from "../../../Components/SmallVideoCard.vue";

defineProps(["videos"]);
</script>

<template>
    <section v-if="videos.length" class="section-shell mt-10">
        <div class="space-y-6">
            <div
                class="rounded-4xl bg-mg-red p-6 shadow-md sm:p-8"
            >
                <div>
                    <p
                        class="font-display text-2xl leading-none text-black sm:text-3xl"
                    >
                        Vaizdo įrašai
                    </p>
                    <p
                        class="mt-1 font-sans text-[10px] leading-[1.2] text-black"
                    >
                        Vaizdo įrašai paimti iš interneto
                    </p>
                </div>

                <div class="mt-6 grid gap-6 lg:grid-cols-3">
                    <SmallVideoCard
                        v-for="video in videos"
                        :key="video.id"
                        :video="video"
                    />
                </div>
            </div>
        </div>
    </section>
</template>
