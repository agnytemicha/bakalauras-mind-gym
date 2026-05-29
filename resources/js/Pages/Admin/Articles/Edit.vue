<script setup>
import { Head } from "@inertiajs/vue3";
import ArticleForm from "../../../Components/Admin/ArticleForm.vue";
import CMSLayout from "../../../Layouts/CMSLayout.vue";

defineOptions({ layout: CMSLayout });

defineProps(["article", "authorOptions", "tags"]);
</script>

<template>
    <Head :title="`Redaguoti ${article.title}`" />

    <ArticleForm
        :article="article"
        :author-options="authorOptions"
        :tags="tags"
    />
</template>
