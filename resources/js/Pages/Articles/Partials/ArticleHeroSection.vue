<script setup>
import authorIconSrc from "@icons/content/author.svg";
import noPhotoIconSrc from "@icons/content/no-photo.svg";

defineProps(["article"]);
</script>

<template>
    <section class="section-shell pt-8">
        <div class="space-y-8">
            <div
                class="overflow-hidden rounded-4xl shadow-md"
            >
                <img
                    v-if="article.coverImage"
                    :src="article.coverImage"
                    class="h-72 w-full object-cover sm:h-96 lg:h-120"
                />
                <div
                    v-else
                    class="flex h-72 items-center justify-center bg-mg-neutral sm:h-96 lg:h-120"
                >
                    <img
                        :src="noPhotoIconSrc"
                        class="h-20 w-20 object-contain opacity-90"
                    />
                </div>
            </div>

            <div>
                <p
                    class="text-sm font-black uppercase tracking-[0.25em] text-zinc-500"
                >
                    {{ article.readingTimeLabel }}
                </p>
                <h1
                    class="mt-5 font-display text-[2.6rem] uppercase leading-none text-black sm:text-[4rem]"
                >
                    {{ article.title }}
                </h1>
                <div
                    class="mt-5 flex flex-wrap items-center gap-x-4 gap-y-3 text-base font-semibold leading-none text-zinc-700"
                >
                    <span>{{ article.publishedAtLabel }}</span>
                    <span class="flex items-center gap-2">
                        <img
                            :src="authorIconSrc"
                            class="h-5 w-5 shrink-0 object-contain"
                        />
                        <span>{{ article.author }}</span>
                    </span>
                </div>

                <div
                    v-if="article.tags.length"
                    class="mt-5 flex flex-wrap gap-2"
                >
                    <span
                        v-for="tag in article.tags"
                        :key="tag.id"
                        class="inline-flex items-center rounded-[0.32rem] bg-mg-red px-3 py-2 font-sans text-lg leading-none text-black shadow-md"
                    >
                        {{ tag.label }}
                    </span>
                </div>

                <p
                    class="mt-6 whitespace-pre-line font-sans text-base font-semibold leading-8 text-zinc-700"
                >
                    {{ article.content }}
                </p>
            </div>
        </div>
    </section>
</template>
