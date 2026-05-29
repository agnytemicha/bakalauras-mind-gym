<script setup>
import { useForm } from "@inertiajs/vue3";
import { computed, ref } from "vue";
import { route } from "ziggy-js";
import { buildImagePayload } from "../../lib/mediaImages";
import CButton from "../UI/CButton.vue";
import GameBasicFieldsSection from "./GameForm/GameBasicFieldsSection.vue";
import GameMediaFilesSection from "./GameForm/GameMediaFilesSection.vue";
import GamePlayTipsSection from "./GameForm/GamePlayTipsSection.vue";
import GameVideosSection from "./GameForm/GameVideosSection.vue";

const props = defineProps([
    "pageTitle",
    "submitLabel",
    "method",
    "tags",
    "difficultyOptions",
    "game",
]);

const images = ref([...props.game.images]);
const existingRuleBooks = ref([...props.game.rulebookFiles]);

const form = useForm({
    title: props.game.title,
    tag_ids: [...props.game.tagIds],
    duration_minutes: props.game.durationMinutes,
    age_rating: props.game.ageRating,
    players_mode: props.game.playersMode,
    min_players: props.game.minPlayers,
    max_players: props.game.maxPlayers,
    difficulty: props.game.difficulty,
    featured: props.game.featured,
    description: props.game.description,
    rules: props.game.rules,
    play_tip_blocks: clonePlayTipBlocks(props.game.playTipBlocks),
    video_blocks: cloneVideoBlocks(props.game.videoBlocks),
    image_order: [],
    removed_image_ids: [],
    rule_books: [],
    remove_rule_book_paths: [],
});

const isEditMode = computed(() => props.method === "put");

function clonePlayTipBlocks(blocks) {
    return blocks.map((block) => ({
        title: block.title,
        body: block.body,
    }));
}

function cloneVideoBlocks(blocks) {
    return blocks.map((block) => ({
        title: block.title,
        author: block.author,
        youtube_url: block.youtube_url,
    }));

}

function updateFiles(field, event) {
    form[field] = Array.from(event.target.files ?? []);
}

function removeNewFile(field, index) {
    form[field].splice(index, 1);
    form[field] = [...form[field]];
}

function removeExistingRuleBook(path) {
    if (!form.remove_rule_book_paths.includes(path)) {
        form.remove_rule_book_paths.push(path);
    }

    existingRuleBooks.value = existingRuleBooks.value.filter(
        (file) => file.path !== path,
    );
}

function addPlayTipBlock() {
    form.play_tip_blocks = [...form.play_tip_blocks, emptyPlayTipBlock()];
}

function removePlayTipBlock(index) {
    form.play_tip_blocks = form.play_tip_blocks.filter(
        (_, blockIndex) => blockIndex !== index,
    );
}

function addVideoBlock() {
    form.video_blocks = [...form.video_blocks, emptyVideoBlock()];
}

function removeVideoBlock(index) {
    form.video_blocks = form.video_blocks.filter(
        (_, blockIndex) => blockIndex !== index,
    );
}

function submit() {
    const imagePayload = buildImagePayload(images.value, props.game.images);
    const submitUrl = gameSubmitUrl();

    form.transform((data) => gameSubmitPayload(data, imagePayload)).post(
        submitUrl,
        {
            forceFormData: true,
            preserveScroll: true,
        },
    );
}

function emptyPlayTipBlock() {
    return { title: "", body: "" };
}

function emptyVideoBlock() {
    return { title: "", author: "", youtube_url: "" };
}

function gameSubmitUrl() {
    return isEditMode.value
        ? route("admin.games.update", props.game.id, false)
        : route("admin.games.store", {}, false);
}

function gameSubmitPayload(data, imagePayload) {
    const payload = {
        title: data.title,
        tag_ids: data.tag_ids,
        duration_minutes: data.duration_minutes,
        age_rating: data.age_rating,
        players_mode: data.players_mode,
        min_players: data.min_players,
        max_players: data.max_players,
        difficulty: data.difficulty,
        featured: data.featured ? 1 : 0,
        description: data.description,
        rules: data.rules,
        play_tip_blocks: data.play_tip_blocks,
        video_blocks: data.video_blocks,
        images: imagePayload.files,
        image_order: imagePayload.order,
        removed_image_ids: imagePayload.removedImageIds,
        rule_books: data.rule_books,
        remove_rule_book_paths: data.remove_rule_book_paths,
    };

    if (isEditMode.value) {
        payload._method = "put";
    }

    return payload;
}
</script>

<template>
    <div class="px-6 py-8 sm:px-8 sm:py-10">
        <div
            class="flex flex-col gap-4 sm:flex-row sm:items-end sm:justify-between"
        >
            <h1
                class="font-display text-[2.8rem] uppercase leading-none text-black sm:text-[3.5rem]"
            >
                {{ pageTitle }}
            </h1>

            <CButton
                :href="route('admin.games.index', {}, false)"
                variant="secondary"
            >
                Grįžti į sąrašą
            </CButton>
        </div>

        <form class="mt-8 space-y-8" @submit.prevent="submit">
            <GameBasicFieldsSection
                :form="form"
                :tags="tags"
                :difficulty-options="difficultyOptions"
            />

            <GamePlayTipsSection
                :form="form"
                @add-block="addPlayTipBlock"
                @remove-block="removePlayTipBlock"
            />

            <GameVideosSection
                :form="form"
                @add-block="addVideoBlock"
                @remove-block="removeVideoBlock"
            />

            <GameMediaFilesSection
                :form="form"
                :images="images"
                :existing-rule-books="existingRuleBooks"
                @update:images="images = $event"
                @update-files="updateFiles"
                @remove-new-file="removeNewFile"
                @remove-existing-rule-book="removeExistingRuleBook"
            />

            <div class="flex flex-col gap-3 sm:flex-row sm:justify-end">
                <CButton
                    :href="route('admin.games.index', {}, false)"
                    variant="secondary"
                >
                    Atšaukti
                </CButton>
                <CButton
                    type="submit"
                    variant="danger"
                    :disabled="form.processing"
                    :loading="form.processing"
                    loading-label="Saugoma..."
                >
                    {{ submitLabel }}
                </CButton>
            </div>
        </form>
    </div>
</template>
