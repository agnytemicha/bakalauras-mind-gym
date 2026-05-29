<script setup>
import { useForm } from "@inertiajs/vue3";
import { computed, ref } from "vue";
import { route } from "ziggy-js";
import { buildImagePayload } from "../../lib/mediaImages";
import CButton from "../UI/CButton.vue";
import CCheckbox from "../UI/CCheckbox.vue";
import CFieldHelpTooltip from "../UI/CFieldHelpTooltip.vue";
import CNumberInput from "../UI/CNumberInput.vue";
import CSelect from "../UI/CSelect.vue";
import CTextInput from "../UI/CTextInput.vue";
import CTextarea from "../UI/CTextarea.vue";
import AdminImageManager from "./AdminImageManager.vue";

const MAX_TAGS = 4;

const props = defineProps({
    tags: {
        type: Array,
        required: true,
    },
    article: {
        type: Object,
        required: true,
    },
    authorOptions: {
        type: Array,
        required: true,
    },
});

const images = ref([...props.article.images]);
const isEditMode = Boolean(props.article.id);
const pageTitle = isEditMode ? "Redaguoti įrašą" : "Sukurti naują įrašą";
const submitLabel = isEditMode ? "Išsaugoti" : "Pridėti";
const submitUrl = isEditMode
    ? route("admin.articles.update", props.article.id, false)
    : route("admin.articles.store", {}, false);

const form = useForm({
    title: props.article.title,
    slug: props.article.slug,
    author: props.article.author,
    tag_ids: [...props.article.tagIds],
    excerpt: props.article.excerpt,
    content: props.article.content,
    reading_time_minutes: props.article.readingTimeMinutes,
    image_order: [],
    removed_image_ids: [],
});

const hasReachedTagLimit = computed(() => form.tag_ids.length >= MAX_TAGS);
function isTagDisabled(tagId) {
    return hasReachedTagLimit.value && !form.tag_ids.includes(tagId);
}

function submit() {
    const imagePayload = buildImagePayload(images.value, props.article.images);

    form.transform((data) => articleSubmitPayload(data, imagePayload)).post(
        submitUrl,
        {
            forceFormData: true,
            preserveScroll: true,
        },
    );
}

function articleSubmitPayload(data, imagePayload) {
    const payload = {
        title: data.title,
        slug: data.slug,
        author: data.author,
        tag_ids: data.tag_ids,
        excerpt: data.excerpt,
        content: data.content,
        reading_time_minutes: data.reading_time_minutes,
        images: imagePayload.files,
        image_order: imagePayload.order,
        removed_image_ids: imagePayload.removedImageIds,
    };

    if (isEditMode) {
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
                :href="route('admin.articles.index', {}, false)"
                variant="secondary"
            >
                Grįžti į sąrašą
            </CButton>
        </div>

        <form class="mt-8 space-y-8" @submit.prevent="submit">
            <section class="grid gap-5 lg:grid-cols-2">
                <CTextInput
                    id="article-title"
                    v-model="form.title"
                    label="Pavadinimas"
                    :error="form.errors.title"
                    wrapper-class="lg:col-span-2"
                    placeholder="Įrašykite straipsnio pavadinimą"
                />

                <CTextInput
                    id="article-slug"
                    v-model="form.slug"
                    label="Nuorodos vardas"
                    :error="form.errors.slug"
                    placeholder="pvz. mano-straipsnis"
                />

                <CNumberInput
                    id="article-reading-time"
                    v-model="form.reading_time_minutes"
                    label="Skaitymo laikas"
                    hint="Įrašykite skaitymo laiką minutėmis."
                    :error="form.errors.reading_time_minutes"
                    min="1"
                    max="60"
                    placeholder="Pvz. 5"
                />

                <CSelect
                    id="article-author"
                    v-model="form.author"
                    label="Autorius"
                    :error="form.errors.author"
                >
                    <option value="">Pasirinkite autorių</option>
                    <option
                        v-for="option in authorOptions"
                        :key="option.value"
                        :value="option.value"
                    >
                        {{ option.label }}
                    </option>
                </CSelect>

                <div class="lg:col-span-2">
                    <div class="flex items-center gap-2">
                        <p
                            class="mb-0 block font-sans text-[1.35rem] font-bold leading-none text-black"
                        >
                            Žymos
                        </p>
                        <CFieldHelpTooltip
                            text="Galima pasirinkti daugiausia 4 žymas."
                        />
                    </div>

                    <div
                        v-if="tags.length"
                        class="mt-3 grid gap-3 sm:grid-cols-2 xl:grid-cols-3"
                    >
                        <CCheckbox
                            v-for="tag in tags"
                            :key="tag.id"
                            v-model="form.tag_ids"
                            :value="tag.id"
                            :label="tag.name"
                            :caption="tag.slug"
                            :disabled="isTagDisabled(tag.id)"
                        />
                    </div>

                    <p
                        v-else
                        class="mt-3 font-sans text-[0.98rem] text-mg-border-gray"
                    >
                        Žymų sąrašas tuščias.
                    </p>
                    <p
                        v-if="form.errors.tag_ids"
                        class="mt-2 font-sans text-sm font-semibold text-red-600"
                    >
                        {{ form.errors.tag_ids }}
                    </p>
                </div>

                <CTextarea
                    id="article-excerpt"
                    v-model="form.excerpt"
                    label="Trumpa ištrauka"
                    :error="form.errors.excerpt"
                    wrapper-class="lg:col-span-2"
                    rows="4"
                    placeholder="Trumpai aprašykite, apie ką yra šis straipsnis"
                />

                <CTextarea
                    id="article-content"
                    v-model="form.content"
                    label="Turinys"
                    :error="form.errors.content"
                    wrapper-class="lg:col-span-2"
                    rows="10"
                    placeholder="Įrašykite pilną straipsnio tekstą"
                />
            </section>

            <AdminImageManager
                v-model="images"
                title="Straipsnio nuotrauka"
                hint="Galite pasirinkti vieną viršelio nuotrauką. Ji bus rodoma sąraše ir viešame puslapyje."
                :multiple="false"
                :error="form.errors.image_order"
                :item-error="form.errors['images.0'] || form.errors.images"
            />

            <div class="flex flex-col gap-3 sm:flex-row sm:justify-end">
                <CButton
                    :href="route('admin.articles.index', {}, false)"
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
