<script setup>
import { ref } from "vue";

const { rules, playTipBlocks } = defineProps(["rules", "playTipBlocks"]);

const showTips = ref(false);
</script>

<template>
    <section
        v-if="rules.trim() || playTipBlocks.length"
        class="section-shell mt-10"
    >
        <div class="space-y-6">
            <div
                v-if="rules.trim()"
                class="rounded-4xl bg-mg-blue p-6 shadow-md sm:p-8"
            >
                <p class="font-display text-3xl leading-none text-black">
                    Kaip žaisti
                </p>
                <p
                    class="mt-3 whitespace-pre-line font-sans text-lg font-semibold leading-[1.45] text-black"
                >
                    {{ rules.trim() }}
                </p>
            </div>

            <div
                v-if="playTipBlocks.length"
                class="rounded-4xl bg-mg-yellow p-6 shadow-md sm:p-8"
            >
                <p
                    class="font-display text-2xl leading-none text-black sm:text-3xl"
                >
                    Patarimai, triukai bei strategijos, kurios padės tau
                    laimėti!
                </p>

                <div v-if="showTips" class="mt-4 space-y-4">
                    <article
                        v-for="(tip, index) in playTipBlocks"
                        :key="`${tip.title}-${index}`"
                    >
                        <p
                            class="font-display text-lg leading-none text-black"
                        >
                            {{ index + 1 }}. {{ tip.title }}
                        </p>
                        <p
                            class="mt-2 whitespace-pre-line font-sans text-base font-semibold leading-[1.35] text-black"
                        >
                            {{ tip.body }}
                        </p>
                    </article>
                </div>

                <button
                    type="button"
                    class="mt-4 inline-flex items-center gap-2 font-sans text-lg font-semibold italic leading-none text-black transition duration-200 hover:opacity-70"
                    :aria-expanded="showTips.toString()"
                    @click="showTips = !showTips"
                >
                    <span>
                        {{
                            showTips
                                ? "Užslėpti spoilerį"
                                : "Perskaityti spoilerį"
                        }}
                    </span>
                    <span aria-hidden="true">{{ showTips ? "↑" : "↓" }}</span>
                </button>
            </div>
        </div>
    </section>
</template>
