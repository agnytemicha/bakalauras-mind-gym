<script setup>
import { Head, router, useForm, usePage } from "@inertiajs/vue3";
import { inject, reactive, ref, watch } from "vue";
import { route } from "ziggy-js";
import PublicLayout from "../../Layouts/PublicLayout.vue";
import GameGallerySection from "./Partials/GameGallerySection.vue";
import GameImageLightbox from "./Partials/GameImageLightbox.vue";
import GameInfoPanelsSection from "./Partials/GameInfoPanelsSection.vue";
import GameInteractionModals from "./Partials/GameInteractionModals.vue";
import GameOverviewPanel from "./Partials/GameOverviewPanel.vue";
import GameReviewsSection from "./Partials/GameReviewsSection.vue";
import GameVideosSection from "./Partials/GameVideosSection.vue";
import SimilarGamesSection from "./Partials/SimilarGamesSection.vue";

defineOptions({ layout: PublicLayout });

const { game, similarGames, canReview } = defineProps([
    "game",
    "similarGames",
    "canReview",
]);

const page = usePage();
const openAuthModal = inject("openAuthModal", () => {});

const activeImageIndex = ref(0);
const isLightboxOpen = ref(false);
const activeGameModal = ref(null);
const selectedReviewId = ref(null);
const pendingActions = reactive({
    owned: false,
    wishlist: false,
    favorite: false,
});

const reviewForm = useForm({
    rating: 5,
    body: "",
});
const reviewCommentForm = useForm({
    body: "",
});

watch(
    () => game.galleryImages,
    (images) => {
        const maxIndex = Math.max(images.length - 1, 0);

        if (activeImageIndex.value > maxIndex) {
            activeImageIndex.value = 0;
        }
    },
    { immediate: true },
);

watch(
    () => game.id,
    () => {
        selectedReviewId.value = null;
        reviewCommentForm.reset();
        reviewCommentForm.clearErrors();
    },
);

function submitReview() {
    if (!canReview) {
        activeGameModal.value = "review-auth";
        return;
    }

    reviewForm.post(route("games.reviews.store", game.slug, false), {
        preserveScroll: true,
        preserveState: true,
        onSuccess: () => {
            reviewForm.reset("body");
            closeGameModal();
        },
    });
}

function submitReviewComment() {
    if (!selectedReviewId.value) {
        return;
    }

    reviewCommentForm.post(
        route(
            "games.review-comments.store",
            { game: game.slug, review: selectedReviewId.value },
            false,
        ),
        {
            preserveScroll: true,
            preserveState: true,
            onSuccess: () => {
                closeGameModal();
            },
        },
    );
}

function showImage(index) {
    const total = game.galleryImages.length;

    if (!total) {
        return;
    }

    activeImageIndex.value = (index + total) % total;
}

function previousImage() {
    if (game.galleryImages.length < 2) {
        return;
    }

    showImage(activeImageIndex.value - 1);
}

function nextImage() {
    if (game.galleryImages.length < 2) {
        return;
    }

    showImage(activeImageIndex.value + 1);
}

function openLightbox(index = activeImageIndex.value) {
    if (!game.galleryImages.length) {
        return;
    }

    showImage(index);
    isLightboxOpen.value = true;
}

function closeGameModal() {
    activeGameModal.value = null;
    selectedReviewId.value = null;
    reviewCommentForm.reset();
    reviewCommentForm.clearErrors();
}

function postGameAction(action, routeName, authModalVariant) {
    if (pendingActions[action]) {
        return;
    }

    if (!page.props.auth.user) {
        activeGameModal.value = authModalVariant;
        return;
    }

    pendingActions[action] = true;

    router.post(
        route(routeName, game.slug, false),
        {},
        {
            preserveScroll: true,
            preserveState: true,
            onFinish: () => {
                pendingActions[action] = false;
            },
        },
    );
}

function toggleOwnedGame() {
    postGameAction("owned", "games.owned", "owned");
}

function toggleWishlistGame() {
    postGameAction("wishlist", "games.wishlist", "wishlist");
}

function toggleFavoriteGame() {
    postGameAction("favorite", "games.favorite", "favorite");
}

function openReviewCommentModal(review) {
    if (!page.props.auth.user) {
        activeGameModal.value = "review-auth";
        return;
    }

    selectedReviewId.value = review.id;
    reviewCommentForm.reset();
    reviewCommentForm.clearErrors();
    activeGameModal.value = "review-comment-form";
}
</script>

<template>
    <Head :title="game.title" />

    <section class="section-shell pt-8">
        <div
            class="grid gap-8 xl:grid-cols-[minmax(0,560px)_minmax(0,1fr)] xl:items-start"
        >
            <GameGallerySection
                :game="game"
                :images="game.galleryImages"
                :active-image-index="activeImageIndex"
                @show-image="showImage"
                @previous-image="previousImage"
                @next-image="nextImage"
                @open-lightbox="openLightbox"
            />

            <GameOverviewPanel
                :game="game"
                :pending-actions="pendingActions"
                @toggle-owned="toggleOwnedGame"
                @toggle-wishlist="toggleWishlistGame"
                @toggle-favorite="toggleFavoriteGame"
            />
        </div>
    </section>

    <GameInfoPanelsSection
        :key="game.id"
        :rules="game.rules"
        :play-tip-blocks="game.playTipBlocks"
    />

    <GameVideosSection :videos="game.videoBlocks" />

    <GameReviewsSection
        :reviews="game.reviews"
        @add-review="
            activeGameModal = canReview ? 'review-form' : 'review-auth'
        "
        @comment-review="openReviewCommentModal"
    />

    <SimilarGamesSection :games="similarGames" />

    <GameInteractionModals
        :active-modal="activeGameModal"
        :review-form="reviewForm"
        :review-comment-form="reviewCommentForm"
        @close="closeGameModal"
        @login="
            closeGameModal();
            openAuthModal('login');
        "
        @submit-review="submitReview"
        @submit-comment="submitReviewComment"
    />

    <GameImageLightbox
        :open="isLightboxOpen"
        :images="game.galleryImages"
        :active-image-index="activeImageIndex"
        @close="isLightboxOpen = false"
        @previous-image="previousImage"
        @next-image="nextImage"
    />
</template>
