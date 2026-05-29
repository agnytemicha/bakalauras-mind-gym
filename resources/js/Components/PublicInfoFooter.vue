<script setup>
import { usePage } from "@inertiajs/vue3";
import { inject } from "vue";
import FooterMascot from "./FooterMascot.vue";
import emailIconSrc from "@icons/contact/email.svg";
import informationIconSrc from "@icons/contact/information.svg";
import phoneIconSrc from "@icons/contact/phone.svg";
import facebookIconSrc from "@icons/social/facebook.svg";
import instagramIconSrc from "@icons/social/instagram.svg";
import tiktokIconSrc from "@icons/social/tiktok.svg";

const page = usePage();
const site = page.props.site;

const openAuthModal = inject("openAuthModal", () => {});
</script>

<template>
    <footer class="w-full bg-mg-blue">
        <div
            class="mx-auto flex w-full max-w-7xl px-4 py-8 sm:px-6 sm:py-10 lg:px-8 xl:min-h-[346px] xl:py-0"
        >
            <div
                class="flex w-full items-end justify-center gap-10 xl:justify-between xl:gap-12"
            >
                <div
                    class="flex w-fit max-w-full flex-wrap items-stretch justify-center gap-5 xl:mt-10 xl:self-start xl:justify-start xl:gap-[64px]"
                >
                    <div class="w-68">
                        <div
                            class="flex h-full flex-col justify-center rounded-3xl bg-mg-red px-4 py-4 shadow-md sm:px-5 sm:py-5"
                        >
                            <a
                                href="/information-about-us#susisiekite"
                                class="flex items-center gap-3 rounded-2xl px-1 py-2 text-left text-black transition duration-200 hover:-translate-y-0.5"
                            >
                                <img
                                    :src="emailIconSrc"
                                    class="h-8 w-8 shrink-0 object-contain"
                                />
                                <span
                                    class="font-sans text-xl font-semibold leading-none text-black"
                                >
                                    susisiekite su mumis
                                </span>
                            </a>

                            <a
                                href="/information-about-us#kontaktai"
                                class="flex items-center gap-3 rounded-2xl px-1 py-2 text-left text-black transition duration-200 hover:-translate-y-0.5"
                            >
                                <img
                                    :src="phoneIconSrc"
                                    class="h-8 w-8 shrink-0 object-contain"
                                />
                                <span
                                    class="font-sans text-xl font-semibold leading-none text-black"
                                >
                                    kontaktai
                                </span>
                            </a>

                            <a
                                href="/information-about-us#apie-mus"
                                class="flex items-center gap-3 rounded-2xl px-1 py-2 text-left text-black transition duration-200 hover:-translate-y-0.5"
                            >
                                <img
                                    :src="informationIconSrc"
                                    class="h-8 w-8 shrink-0 object-contain"
                                />
                                <span
                                    class="font-sans text-xl font-semibold leading-none text-black"
                                >
                                    apie mus
                                </span>
                            </a>
                        </div>
                    </div>

                    <div class="w-68">
                        <div
                            class="flex h-full flex-col justify-center rounded-3xl bg-mg-red px-4 py-4 shadow-md sm:px-5 sm:py-5"
                        >
                            <a
                                :href="site.facebookUrl"
                                class="flex items-center gap-3 rounded-2xl px-1 py-2 text-left text-black transition duration-200 hover:-translate-y-0.5"
                                target="_blank"
                                rel="noreferrer"
                            >
                                <img
                                    :src="facebookIconSrc"
                                    class="h-8 w-8 shrink-0 object-contain"
                                />
                                <span
                                    class="font-sans text-xl font-semibold leading-none text-black"
                                >
                                    mind gym
                                </span>
                            </a>

                            <a
                                :href="site.instagramUrl"
                                class="flex items-center gap-3 rounded-2xl px-1 py-2 text-left text-black transition duration-200 hover:-translate-y-0.5"
                                target="_blank"
                                rel="noreferrer"
                            >
                                <img
                                    :src="instagramIconSrc"
                                    class="h-8 w-8 shrink-0 object-contain"
                                />
                                <span
                                    class="font-sans text-xl font-semibold leading-none text-black"
                                >
                                    mind.gym.web
                                </span>
                            </a>

                            <a
                                :href="site.tiktokUrl"
                                class="flex items-center gap-3 rounded-2xl px-1 py-2 text-left text-black transition duration-200 hover:-translate-y-0.5"
                                target="_blank"
                                rel="noreferrer"
                            >
                                <img
                                    :src="tiktokIconSrc"
                                    class="h-8 w-8 shrink-0 object-contain"
                                />
                                <span
                                    class="font-sans text-xl font-semibold leading-none text-black"
                                >
                                    mindgymofficial
                                </span>
                            </a>
                        </div>
                    </div>
                </div>

                <div
                    class="ml-auto hidden flex-none self-end justify-items-end xl:grid"
                >
                    <FooterMascot @login="openAuthModal('login')" />
                </div>
            </div>
        </div>
    </footer>
</template>
