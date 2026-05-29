<script setup>
import { usePage } from "@inertiajs/vue3";
import { inject } from "vue";
import CButton from "../../../Components/UI/CButton.vue";

defineProps(["stats"]);

const page = usePage();
const openAuthModal = inject("openAuthModal", () => {});
</script>

<template>
    <section id="community" class="section-shell mt-16 scroll-mt-32">
        <div
            class="relative overflow-hidden rounded-4xl bg-mg-red px-7 py-9 shadow-md sm:px-9 sm:py-10 lg:px-12 lg:py-12"
        >
            <div id="about" class="h-0 scroll-mt-32" />

            <div
                class="relative grid gap-8 lg:grid-cols-[0.92fr_1.08fr] lg:items-start"
            >
                <div>
                    <h2
                        class="font-display text-5xl uppercase leading-[0.92] text-black"
                    >
                        Prisijunk prie Mind Gym bendruomenės!
                    </h2>
                    <p
                        class="mt-5 max-w-2xl font-sans text-xl leading-8 text-black"
                    >
                        Čia lengva rasti tiek vakarėlių, tiek strategiškus ar
                        paprastus žaidimų vakarus! Kiekvienas prisijungęs narys
                        gali dalyvauti renginiuose, palikti atsiliepimus ar
                        komentarus.
                    </p>

                    <div class="mt-7 flex flex-wrap gap-3">
                        <CButton
                            v-if="!page.props.auth.user"
                            variant="accent"
                            @click="openAuthModal('login')"
                        >
                            Prisijunk
                        </CButton>
                        <CButton v-else href="/events" variant="secondary">
                            Peržiūrėti renginius
                        </CButton>
                    </div>
                </div>

                <div class="grid gap-4">
                    <div
                        class="rounded-4xl bg-mg-yellow px-6 py-6 shadow-md"
                    >
                        <p
                            class="font-display text-[2rem] uppercase leading-none text-black"
                        >
                            Kodėl Mind Gym?
                        </p>
                        <p
                            class="mt-4 font-sans text-xl leading-8 text-black"
                        >
                            Mind Gym sujungia žaidimus, aiškius paaiškinimus,
                            renginius ir bendruomenės įspūdžius vienoje vietoje.
                        </p>
                    </div>

                    <div class="grid gap-4 sm:grid-cols-3">
                        <article
                            v-for="item in stats"
                            :key="item.label"
                            class="rounded-3xl bg-white px-4 py-3 text-center shadow-md"
                        >
                            <p
                                class="font-sans text-sm font-bold normal-case tracking-normal text-zinc-600"
                            >
                                {{ item.label }}
                            </p>
                            <p
                                class="mt-3 font-display text-[2.2rem] uppercase leading-none text-black"
                            >
                                {{ item.value }}
                            </p>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>
