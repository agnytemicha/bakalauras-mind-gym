<script setup>
import HomeContentSection from "../../../Components/HomeContentSection.vue";
import ArticleCard from "../../../Components/ArticleCard.vue";

defineProps(["articles"]);
</script>

<template>
    <HomeContentSection
        v-if="articles.length"
        class="mt-16"
        title="Naujausi straipsniai"
        href="/blogs/all"
    >
        <div
            class="-mx-4 overflow-x-auto px-4 pb-4 sm:-mx-6 sm:px-6 xl:mx-0 xl:px-0 xl:overflow-visible"
        >
            <div
                class="flex min-w-max snap-x snap-mandatory items-stretch gap-6 xl:grid xl:min-w-0 xl:grid-cols-3"
            >
                <div
                    v-for="(article, index) in articles"
                    :key="article.slug"
                    class="w-72 shrink-0 snap-start sm:w-88 md:w-96 lg:w-100 xl:w-auto xl:shrink"
                >
                    <ArticleCard
                        :article="article"
                        :card-index="index"
                        variant="compact"
                    />
                </div>
            </div>
        </div>
    </HomeContentSection>
</template>
