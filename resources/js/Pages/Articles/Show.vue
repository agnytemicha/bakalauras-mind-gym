<script setup>
import { Head, useForm, usePage } from "@inertiajs/vue3";
import { inject, ref } from "vue";
import { route } from "ziggy-js";
import PublicLayout from "../../Layouts/PublicLayout.vue";
import ArticleCommentModals from "./Partials/ArticleCommentModals.vue";
import ArticleCommentsSection from "./Partials/ArticleCommentsSection.vue";
import ArticleHeroSection from "./Partials/ArticleHeroSection.vue";
import ArticleRelatedSection from "./Partials/ArticleRelatedSection.vue";

defineOptions({ layout: PublicLayout });

const { article, relatedArticles } = defineProps([
    "article",
    "relatedArticles",
]);

const page = usePage();
const openAuthModal = inject("openAuthModal", () => {});

const activeCommentModal = ref(null);
const selectedCommentId = ref(null);

const commentForm = useForm({
    body: "",
});

function closeCommentModal() {
    activeCommentModal.value = null;
    selectedCommentId.value = null;
    commentForm.reset();
    commentForm.clearErrors();
}

function openCommentModal() {
    activeCommentModal.value = page.props.auth.user
        ? "comment-form"
        : "comment-auth";
}

function openLoginFromCommentPrompt() {
    closeCommentModal();
    openAuthModal("login");
}

function openReplyModal(comment) {
    if (!page.props.auth.user) {
        activeCommentModal.value = "comment-auth";
        return;
    }

    selectedCommentId.value = comment.id;
    commentForm.reset();
    commentForm.clearErrors();
    activeCommentModal.value = "reply-form";
}

function submitComment() {
    if (!page.props.auth.user) {
        activeCommentModal.value = "comment-auth";
        return;
    }

    if (activeCommentModal.value === "reply-form" && !selectedCommentId.value) {
        return;
    }

    const url =
        activeCommentModal.value === "reply-form"
            ? route(
                  "blogs.comment-replies.store",
                  { article: article.slug, comment: selectedCommentId.value },
                  false,
              )
            : route("blogs.comments.store", article.slug, false);

    commentForm.post(url, {
        preserveScroll: true,
        preserveState: true,
        onSuccess: () => closeCommentModal(),
    });
}
</script>

<template>
    <Head :title="article.title" />

    <ArticleHeroSection :article="article" />

    <ArticleCommentsSection
        :comments="article.comments"
        @add-comment="openCommentModal"
        @reply="openReplyModal"
    />

    <ArticleRelatedSection :related-articles="relatedArticles" />

    <ArticleCommentModals
        :active-modal="activeCommentModal"
        :form="commentForm"
        @close="closeCommentModal"
        @login="openLoginFromCommentPrompt"
        @submit="submitComment"
    />
</template>
