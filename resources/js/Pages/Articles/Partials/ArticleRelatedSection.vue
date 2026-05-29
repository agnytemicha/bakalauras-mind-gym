<script setup>
import ArticleCard from "../../../Components/ArticleCard.vue";
import CButton from "../../../Components/UI/CButton.vue";

defineProps(["relatedArticles"]);
</script>

<template>
    <section class="section-shell mt-12">
        <div class="mb-6 flex items-end justify-between gap-4">
            <div>
                <p class="font-display text-3xl uppercase text-black">
                    Kiti įrašai
                </p>
            </div>
            <CButton href="/blogs/all" variant="secondary">
                Grįžti į visus įrašus
            </CButton>
        </div>

        <div class="grid gap-6 lg:grid-cols-3">
            <ArticleCard
                v-for="(relatedArticle, index) in relatedArticles"
                :key="relatedArticle.slug"
                :article="relatedArticle"
                :card-index="index"
            />
        </div>
    </section>
</template>
