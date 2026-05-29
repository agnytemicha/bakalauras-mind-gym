<script setup>
import { Link } from "@inertiajs/vue3";
import { route } from "ziggy-js";
import deleteIconSrc from "@icons/actions/delete.svg";
import editIconSrc from "@icons/actions/edit.svg";
import authorIconSrc from "@icons/content/author.svg";
import noPhotoIconSrc from "@icons/content/no-photo.svg";

defineOptions({
    name: "ArticleListCard",
});

const { article } = defineProps(["article"]);

const emit = defineEmits(["delete"]);

function destroyArticle() {
    emit("delete", article);
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
                    :class="article.coverImage ? '' : 'bg-mg-neutral'"
                >
                    <img
                        v-if="article.coverImage"
                        :src="article.coverImage"
                        class="h-full w-full object-cover"
                    />
                    <img
                        v-else
                        :src="noPhotoIconSrc"
                        class="h-16 w-16 object-contain opacity-90"
                    />
                </div>
            </div>

            <div class="min-w-0 md:flex md:h-full md:flex-col">
                <div
                    class="grid gap-3 sm:grid-cols-[minmax(0,1fr)_auto] sm:items-start sm:gap-4"
                >
                    <div class="min-w-0 flex flex-wrap gap-2">
                        <span
                            v-for="tag in article.tags"
                            :key="tag.id"
                            class="inline-flex items-center rounded-[0.55rem] bg-mg-blue px-3 py-1.5 font-sans text-[0.88rem] font-semibold text-black"
                        >
                            {{ tag.label }}
                        </span>
                    </div>

                    <div
                        class="flex flex-nowrap gap-2 self-start sm:-mt-1 sm:justify-self-end"
                    >
                        <Link
                            :href="
                                route('admin.articles.edit', article.id, false)
                            "
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
                            @click="destroyArticle"
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
                    {{ article.title }}
                </h2>

                <div
                    class="mt-3 flex items-center gap-2 font-sans text-[0.98rem] font-semibold text-black"
                >
                    <img
                        :src="authorIconSrc"
                        class="h-5 w-5 shrink-0 object-contain"
                    />
                    <span>{{ article.author }}</span>
                </div>

                <p
                    class="mt-3 font-sans text-base italic leading-7 text-mg-text-gray"
                >
                    {{ article.excerpt }}
                </p>

                <div
                    class="mt-5 flex items-end justify-end gap-4 md:mt-auto md:pt-5"
                >
                    <a
                        :href="route('blogs.show', article.slug, false)"
                        class="inline-flex items-center rounded-2xl px-4 py-2 font-sans text-[0.98rem] font-semibold text-black transition duration-200 hover:-translate-y-0.5 hover:text-slate-900"
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
