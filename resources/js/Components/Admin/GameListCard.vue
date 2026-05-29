<script setup>
import { Link, router } from "@inertiajs/vue3";
import { route } from "ziggy-js";
import deleteIconSrc from "@icons/actions/delete.svg";
import editIconSrc from "@icons/actions/edit.svg";

const { game } = defineProps(["game"]);

function destroyGame() {
    if (!window.confirm(`Ar tikrai norite pašalinti "${game.title}"?`)) {
        return;
    }

    router.delete(route("admin.games.destroy", game.id, false), {
        preserveScroll: true,
    });
}
</script>

<template>
    <article
        class="h-full rounded-4xl border border-mg-border-gray bg-white p-5 shadow-md"
    >
        <div class="grid h-full gap-5 md:grid-cols-[15rem_minmax(0,1fr)]">
            <div
                class="flex h-full justify-center md:items-stretch md:justify-start"
            >
                <div
                    class="flex aspect-square w-full max-w-60 items-center justify-center overflow-hidden rounded-4xl shadow-md md:aspect-auto md:h-full md:min-h-60"
                >
                    <img
                        v-if="game.coverImage"
                        :src="game.coverImage"
                        class="h-full w-full object-cover"
                    />
                    <div
                        v-else
                        class="flex h-full w-full items-center justify-center p-4 text-center"
                    >
                        <p
                            class="font-display text-3xl uppercase leading-none text-black"
                        >
                            {{ game.title }}
                        </p>
                    </div>
                </div>
            </div>

            <div class="min-w-0 md:flex md:h-full md:flex-col">
                <div
                    class="grid gap-3 sm:grid-cols-[minmax(0,1fr)_auto] sm:items-start sm:gap-4"
                >
                    <div class="min-w-0 flex flex-wrap gap-2">
                        <span
                            v-for="tag in game.tags"
                            :key="tag.id"
                            class="inline-flex items-center rounded-lg bg-mg-blue px-2.5 py-1.5 font-sans text-[0.88rem] font-semibold text-black"
                        >
                            {{ tag.name }}
                        </span>
                    </div>
                    <div
                        class="flex flex-nowrap gap-2 self-start sm:-mt-1 sm:justify-self-end"
                    >
                        <Link
                            :href="route('admin.games.edit', game.id, false)"
                            class="inline-flex h-12 w-12 items-center justify-center rounded-2xl transition duration-200 hover:-translate-y-0.5 hover:opacity-80"
                        >
                            <img
                                :src="editIconSrc"
                                class="h-6 w-6 object-contain"
                            />
                        </Link>
                        <button
                            type="button"
                            class="inline-flex h-12 w-12 items-center justify-center rounded-2xl transition duration-200 hover:-translate-y-0.5 hover:opacity-80"
                            @click="destroyGame"
                        >
                            <img
                                :src="deleteIconSrc"
                                class="h-6 w-6 object-contain"
                            />
                        </button>
                    </div>
                </div>

                <h2
                    class="mt-3 font-display text-[32px] leading-none text-black"
                >
                    {{ game.title }}
                </h2>

                <div class="mt-4 flex flex-wrap gap-2">
                    <span
                        class="inline-flex items-center rounded-2xl bg-mg-panel-gray px-4 py-2 font-sans text-[0.98rem] font-semibold text-black"
                        >{{ game.playersCountLabel }}</span
                    >
                    <span
                        class="inline-flex items-center rounded-2xl bg-mg-panel-gray px-4 py-2 font-sans text-[0.98rem] font-semibold text-black"
                        >{{ game.ageRatingLabel }}</span
                    >
                    <span
                        class="inline-flex items-center rounded-2xl bg-mg-panel-gray px-4 py-2 font-sans text-[0.98rem] font-semibold text-black"
                        >{{ game.durationLabel }}</span
                    >
                    <span
                        class="inline-flex items-center rounded-2xl bg-mg-panel-gray px-4 py-2 font-sans text-[0.98rem] font-semibold text-black"
                        >{{ game.difficultyLabel }}</span
                    >
                    <span
                        class="inline-flex items-center rounded-2xl bg-mg-panel-gray px-4 py-2 font-sans text-[0.98rem] font-semibold text-black"
                        >{{ game.photoCountLabel }}</span
                    >
                    <span
                        class="inline-flex items-center rounded-2xl bg-mg-panel-gray px-4 py-2 font-sans text-[0.98rem] font-semibold text-black"
                        >{{ game.ruleBookCountLabel }}</span
                    >
                </div>

                <div class="mt-5 flex justify-end md:mt-auto md:pt-5">
                    <a
                        :href="route('games.show', game.slug, false)"
                        class="inline-flex items-center rounded-2xl px-4 py-2 font-sans text-[0.98rem] font-semibold text-black transition duration-200 hover:-translate-y-0.5"
                        target="_blank"
                        rel="noreferrer"
                    >
                        Vieša peržiūra
                    </a>
                </div>
            </div>
        </div>
    </article>
</template>
