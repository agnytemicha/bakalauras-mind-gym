<script setup>
import { computed } from "vue";
import { Link } from "@inertiajs/vue3";
import { route } from "ziggy-js";
import authorIconSrc from "@icons/content/author.svg";
import noPhotoIconSrc from "@icons/content/no-photo.svg";

defineOptions({
    name: "ArticleCard",
});

const { article, cardIndex, variant } = defineProps([
    "article",
    "cardIndex",
    "variant",
]);

const isCompact = computed(() => variant === "compact");
const accentClass = computed(() => {
    if (cardIndex % 3 === 1) {
        return "bg-mg-yellow";
    }

    if (cardIndex % 3 === 2) {
        return "bg-mg-red";
    }

    return "bg-mg-blue";
});
</script>

<template>
    <article class="h-full">
        <Link
            :href="route('blogs.show', article.slug, false)"
            class="flex h-full flex-col rounded-4xl bg-white p-5 shadow-md transition duration-200 hover:-translate-y-0.5"
        >
            <span
                class="inline-flex w-fit items-center rounded-full bg-mg-neutral px-3 py-1 text-xs font-bold tracking-[0.12em] text-black font-sans"
            >
                {{ article.readingTimeLabel }}
            </span>

            <div
                v-if="isCompact"
                class="mt-4 h-5 w-full rounded-full"
                :class="accentClass"
            />
            <div v-else class="mt-4 rounded-4xl p-5" :class="accentClass">
                <img
                    v-if="article.coverImage"
                    :src="article.coverImage"
                    alt=""
                    class="h-29 w-full rounded-3xl object-cover"
                />
                <div
                    v-else
                    class="flex h-29 w-full items-center justify-center rounded-3xl"
                >
                    <img
                        :src="noPhotoIconSrc"
                        alt=""
                        class="h-16 w-16 object-contain opacity-90"
                    />
                </div>
            </div>

            <div class="mt-4 flex flex-1 flex-col">
                <h2
                    class="font-display text-3xl uppercase leading-none text-black"
                >
                    {{ article.title }}
                </h2>

                <div
                    class="mt-3 flex items-center gap-2 font-sans text-base font-semibold text-mg-text-gray"
                >
                    <img
                        :src="authorIconSrc"
                        alt=""
                        class="h-5 w-5 shrink-0 object-contain"
                    />
                    <span>{{ article.author }}</span>
                </div>

                <p
                    v-if="!isCompact"
                    class="mt-3 flex-1 overflow-hidden font-sans text-lg italic leading-[1.45] text-mg-text-gray [display:-webkit-box] [-webkit-box-orient:vertical] [-webkit-line-clamp:3]"
                >
                    {{ article.excerpt }}
                </p>

                <div
                    class="flex items-center justify-between gap-3 font-sans text-sm font-semibold text-mg-border-gray"
                    :class="isCompact ? 'mt-auto pt-5' : 'mt-5'"
                >
                    <span>{{ article.publishedAtLabel }}</span>
                    <span>{{ article.commentCountLabel }}</span>
                </div>
            </div>
        </Link>
    </article>
</template>
