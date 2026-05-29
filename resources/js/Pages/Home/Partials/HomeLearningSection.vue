<script setup>
import rulesIllustrationSrc from "@images/illustrations/home/rules.png";
import spellbookIllustrationSrc from "@images/illustrations/home/spellbook.png";
import videoLessonIllustrationSrc from "@images/illustrations/home/video-lesson.png";
</script>

<template>
    <section id="learn" class="section-shell mt-16 scroll-mt-32">
        <div class="mb-6">
            <p
                class="font-display text-[2.4rem] uppercase leading-none text-black sm:text-5xl"
            >
                Išmok žaisti naujus žaidimus
            </p>
        </div>

        <div class="grid gap-6 lg:auto-rows-fr lg:grid-cols-3">
            <article
                class="flex h-full flex-col rounded-4xl bg-mg-neutral px-5 pb-4 pt-6 shadow-md sm:px-6 sm:pb-5 lg:px-7"
            >
                <h2
                    class="mt-1 font-display text-[40px] uppercase leading-[0.92] text-black"
                >
                    TAISYKLĖS
                </h2>
                <p
                    class="mt-5 font-sans text-xl font-semibold leading-[1.2] text-black"
                >
                    Sužinok paprastas ir aiškias kiekvieno žaidimo taisykles.
                    Jokio galvos skausmo - tik smagus žaidimas su teisingomis
                    sąlygomis!
                </p>

                <div
                    class="mt-4 flex flex-1 flex-col items-center text-center sm:mt-5"
                >
                    <img
                        :src="rulesIllustrationSrc"
                        class="mx-auto w-46 max-w-full object-contain shadow-md sm:w-49 lg:w-52"
                    />
                    <p
                        class="mt-auto max-w-full break-words pt-2 font-sans text-base italic leading-[1.15] text-black"
                    >
                        Taisykles rasite prie stalo žaidimų aprašymo.
                    </p>
                </div>
            </article>

            <article
                class="flex h-full flex-col rounded-4xl bg-mg-neutral px-5 pb-4 pt-6 shadow-md sm:px-6 sm:pb-5 lg:px-7"
            >
                <h2
                    class="mt-1 font-display text-[40px] uppercase leading-[0.92] text-black"
                >
                    TRIUKAI
                </h2>
                <p
                    class="mt-5 font-sans text-xl font-semibold leading-[1.2] text-black"
                >
                    Slapti ar pamiršti ėjimai, protingi pasirinkimai, gudrybės
                    ir laimėjimo būdai - išmok to, ko nežino tavo priešininkai!
                </p>

                <div
                    class="mt-4 flex flex-1 flex-col items-center text-center sm:mt-5"
                >
                    <img
                        :src="spellbookIllustrationSrc"
                        class="mx-auto w-46 max-w-full object-contain shadow-md sm:w-49 lg:w-52"
                    />
                    <p
                        class="mt-auto max-w-full break-words pt-2 font-sans text-base italic leading-[1.15] text-black"
                    >
                        Triukus ir patarimus rasite prie stalo žaidimų aprašymo.
                    </p>
                </div>
            </article>

            <article
                class="flex h-full flex-col rounded-4xl bg-mg-neutral px-5 pb-4 pt-6 shadow-md sm:px-6 sm:pb-5 lg:px-7"
            >
                <h2
                    class="mt-1 font-display text-[40px] uppercase leading-[0.92] text-black"
                >
                    PAMOKĖLĖS
                </h2>
                <p
                    class="mt-5 font-sans text-xl font-semibold leading-[1.2] text-black"
                >
                    Nemėgsti skaityti taisyklių? Mūsų vaizdo pamokos paaiškins
                    viską per kelias minutes!
                </p>

                <div
                    class="mt-4 flex flex-1 flex-col items-center text-center sm:mt-5"
                >
                    <img
                        :src="videoLessonIllustrationSrc"
                        class="mx-auto w-46 max-w-full object-contain shadow-md sm:w-49 lg:w-52"
                    />
                    <p
                        class="mt-auto max-w-full break-words pt-2 font-sans text-base italic leading-[1.15] text-black"
                    >
                        ŽIŪRĖK, MOKYKIS, ŽAISK! Vaizdo įrašus rasite prie stalo
                        žaidimų aprašymo.
                    </p>
                </div>
            </article>
        </div>
    </section>
</template>
