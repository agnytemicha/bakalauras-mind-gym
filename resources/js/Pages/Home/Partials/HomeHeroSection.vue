<script setup>
import { ref } from "vue";
import CarouselArrowButton from "../../../Components/CarouselArrowButton.vue";
import CButton from "../../../Components/UI/CButton.vue";
import boardGamePhotoSrc from "@images/photos/home/boardgame-photo.jpg";
import catanPhotoSrc from "@images/photos/home/catan.jpg";

const activeSlide = ref(0);
const heroCarouselViewport = ref(null);

const heroSlides = [
    {
        id: "games",
        title: "MĄSTYK. ŽAISK. PRISIJUNK.",
        body: "Nesupranti kaip žaisti? Peržiūrėk kiekvieną stalo žaidimą individualiai, kur rasi pamokėles ir triukus!",
        background: "var(--color-mg-yellow)",
        mediaSrc: boardGamePhotoSrc,
        primaryHref: "/games",
        primaryLabel: "Peržiūrėti žaidimus",
    },
    {
        id: "blog",
        title: "TINKLARAŠTIS:",
        body: "Kodėl strateginiai stalo žaidimai taip įtraukia: ne tik pramoga, bet ir mąstymo treniruotė",
        background: "var(--color-mg-blue)",
        mediaSrc:
            "/storage/images/articles/22/ff/22ff0e58e45946f5ab408410741eea1229f4d6eb.jpg",
    },
    {
        id: "weekly-game",
        title: "ŠIOS SAVAITĖS ŽAIDIMAS:",
        body: "Catan",
        background: "var(--color-mg-red)",
        mediaSrc: catanPhotoSrc,
        featuredBody: true,
    },
];

function updateActiveSlideFromScroll() {
    const viewport = heroCarouselViewport.value;

    if (!viewport || !viewport.clientWidth) {
        return;
    }

    activeSlide.value = Math.round(viewport.scrollLeft / viewport.clientWidth);
}

function goToSlide(index) {
    const slideIndex = wrapSlideIndex(index);
    activeSlide.value = slideIndex;

    const viewport = heroCarouselViewport.value;

    if (!viewport) {
        return;
    }

    viewport.scrollTo({
        left: slideIndex * viewport.clientWidth,
        behavior: "smooth",
    });
}

function wrapSlideIndex(index) {
    return (index + heroSlides.length) % heroSlides.length;
}

function nextSlide() {
    goToSlide(activeSlide.value + 1);
}

function previousSlide() {
    goToSlide(activeSlide.value - 1);
}
</script>

<template>
    <section class="section-shell pt-8">
        <div class="relative">
            <CarouselArrowButton
                direction="previous"
                size="lg"
                class="absolute inset-y-0 left-0 z-10 my-auto -translate-x-1/2 lg:-translate-x-[115%]"
                @click="previousSlide"
            />

            <div
                ref="heroCarouselViewport"
                class="relative overflow-x-auto rounded-4xl scroll-smooth snap-x snap-mandatory [scrollbar-width:none] [&::-webkit-scrollbar]:hidden"
                @scroll.passive="updateActiveSlideFromScroll"
            >
                <div class="flex w-full">
                    <article
                        v-for="slide in heroSlides"
                        :key="slide.id"
                        class="min-h-136 w-full shrink-0 snap-start sm:min-h-148 lg:min-h-128"
                    >
                        <div
                            class="grid min-h-136 items-center gap-6 rounded-4xl px-6 py-8 shadow-md sm:min-h-148 sm:px-8 sm:py-10 lg:min-h-128 lg:grid-cols-2 lg:gap-10 lg:px-10 lg:py-10"
                            :style="{ backgroundColor: slide.background }"
                        >
                            <div
                                class="flex w-full flex-col justify-center lg:max-w-124"
                            >
                                <h1
                                    class="max-w-124 font-display text-[3.2rem] uppercase leading-[1.02] text-black sm:text-[4.2rem] lg:text-[4.9rem]"
                                >
                                    {{ slide.title }}
                                </h1>
                                <p
                                    v-if="slide.featuredBody"
                                    class="mt-6 inline-flex w-fit items-center justify-center rounded-2xl bg-mg-blue px-6 py-3 font-sans text-[2.8rem] font-semibold italic leading-none text-black shadow-md sm:text-[3.3rem] lg:text-[4.1rem]"
                                >
                                    {{ slide.body }}
                                </p>
                                <p
                                    v-else
                                    class="mt-6 max-w-136 font-sans text-[1.45rem] font-semibold italic leading-[1.3] text-black sm:text-[1.55rem] lg:text-2xl"
                                >
                                    {{ slide.body }}
                                </p>

                                <div
                                    v-if="slide.primaryHref"
                                    class="mt-8 flex flex-wrap gap-3"
                                >
                                    <CButton
                                        :href="slide.primaryHref"
                                        variant="danger"
                                    >
                                        {{ slide.primaryLabel }}
                                    </CButton>
                                </div>
                            </div>

                            <div
                                class="flex min-h-56 items-center justify-center lg:min-h-108"
                            >
                                <img
                                    :src="slide.mediaSrc"
                                    class="max-h-116 w-full rounded-3xl object-cover"
                                />
                            </div>
                        </div>
                    </article>
                </div>
            </div>

            <CarouselArrowButton
                direction="next"
                size="lg"
                class="absolute inset-y-0 right-0 z-10 my-auto translate-x-1/2 lg:translate-x-[115%]"
                @click="nextSlide"
            />
        </div>

        <div class="mt-3 flex items-center justify-center gap-3 sm:mt-4">
            <button
                v-for="(slide, index) in heroSlides"
                :key="`${slide.id}-dot`"
                type="button"
                :class="[
                    'h-4 w-4 rounded-full transition duration-200',
                    index === activeSlide ? 'bg-mg-border-gray' : 'bg-mg-light-gray',
                ]"
                @click="goToSlide(index)"
            />
        </div>
    </section>
</template>
