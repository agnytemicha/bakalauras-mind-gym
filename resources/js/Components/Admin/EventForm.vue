<script setup>
import { useForm } from "@inertiajs/vue3";
import { ref } from "vue";
import { route } from "ziggy-js";
import { buildImagePayload } from "../../lib/mediaImages";
import CButton from "../UI/CButton.vue";
import CDateTimeField from "../UI/CDateTimeField.vue";
import CNumberInput from "../UI/CNumberInput.vue";
import CSelect from "../UI/CSelect.vue";
import CTextInput from "../UI/CTextInput.vue";
import CTextarea from "../UI/CTextarea.vue";
import AdminImageManager from "./AdminImageManager.vue";

const props = defineProps({
    difficultyOptions: {
        type: Array,
        required: true,
    },
    priceOptions: {
        type: Array,
        required: true,
    },
    event: {
        type: Object,
        required: true,
    },
});

const images = ref([...props.event.images]);
const isEditMode = Boolean(props.event.id);
const pageTitle = isEditMode ? "Redaguoti renginį" : "Sukurti naują renginį";
const submitLabel = isEditMode ? "Išsaugoti" : "Pridėti";
const submitUrl = isEditMode
    ? route("admin.events.update", props.event.id, false)
    : route("admin.events.store", {}, false);

const form = useForm({
    title: props.event.title,
    slug: props.event.slug,
    description: props.event.description,
    starts_at_date: props.event.startsAtDate,
    starts_at_time: props.event.startsAtTime,
    ends_at_date: props.event.endsAtDate,
    ends_at_time: props.event.endsAtTime,
    location: props.event.location,
    difficulty_level: props.event.difficultyLevel,
    price_type: props.event.priceType,
    seats_total: props.event.seatsTotal,
    status: props.event.status,
    image_order: [],
    removed_image_ids: [],
});

function submit() {
    const imagePayload = buildImagePayload(images.value, props.event.images);

    form.transform((data) => eventSubmitPayload(data, imagePayload)).post(
        submitUrl,
        {
            forceFormData: true,
            preserveScroll: true,
        },
    );
}

function eventSubmitPayload(data, imagePayload) {
    const payload = {
        title: data.title,
        slug: data.slug,
        description: data.description,
        starts_at_date: data.starts_at_date,
        starts_at_time: data.starts_at_time,
        ends_at_date: data.ends_at_date,
        ends_at_time: data.ends_at_time,
        location: data.location,
        difficulty_level: data.difficulty_level,
        price_type: data.price_type,
        seats_total: data.seats_total,
        status: data.status,
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
                :href="route('admin.events.index', {}, false)"
                variant="secondary"
            >
                Grįžti į sąrašą
            </CButton>
        </div>

        <form class="mt-8 space-y-8" @submit.prevent="submit">
            <section class="grid gap-5 lg:grid-cols-2">
                <CTextInput
                    id="event-title"
                    v-model="form.title"
                    label="Pavadinimas"
                    :error="form.errors.title"
                    wrapper-class="lg:col-span-2"
                    placeholder="Įrašykite renginio pavadinimą"
                />

                <CTextInput
                    id="event-slug"
                    v-model="form.slug"
                    label="Nuorodos vardas"
                    :error="form.errors.slug"
                    placeholder="pvz. zaidimu-vakaras"
                />

                <CSelect
                    id="event-status"
                    v-model="form.status"
                    label="Būsena"
                    :error="form.errors.status"
                >
                    <option value="upcoming">Aktyvus</option>
                    <option value="cancelled">Atšauktas</option>
                </CSelect>

                <CTextInput
                    id="event-location"
                    v-model="form.location"
                    label="Vieta"
                    :error="form.errors.location"
                    placeholder="Pvz. Mind Gym studija, Vilnius"
                />

                <CSelect
                    id="event-difficulty-level"
                    v-model="form.difficulty_level"
                    label="Sudėtingumas"
                    :error="form.errors.difficulty_level"
                >
                    <option value="">Pasirinkite sudėtingumą</option>
                    <option
                        v-for="option in difficultyOptions"
                        :key="option.value"
                        :value="option.value"
                    >
                        {{ option.label }}
                    </option>
                </CSelect>

                <CSelect
                    id="event-price-type"
                    v-model="form.price_type"
                    label="Kaina"
                    :error="form.errors.price_type"
                >
                    <option value="">Pasirinkite kainą</option>
                    <option
                        v-for="option in priceOptions"
                        :key="option.value"
                        :value="option.value"
                    >
                        {{ option.label }}
                    </option>
                </CSelect>

                <CNumberInput
                    id="event-seats"
                    v-model="form.seats_total"
                    label="Vietų skaičius"
                    :error="form.errors.seats_total"
                    min="1"
                    max="200"
                    placeholder="Pvz. 20"
                />

                <div class="lg:col-span-2">
                    <div class="grid gap-5 lg:grid-cols-3">
                        <CDateTimeField
                            id-prefix="event-starts-at"
                            v-model:date-value="form.starts_at_date"
                            v-model:time-value="form.starts_at_time"
                            label="Pradžia"
                            :error="form.errors.starts_at"
                        />

                        <CDateTimeField
                            id-prefix="event-ends-at"
                            v-model:date-value="form.ends_at_date"
                            v-model:time-value="form.ends_at_time"
                            label="Pabaiga"
                            :error="form.errors.ends_at"
                        />
                    </div>
                </div>

                <CTextarea
                    id="event-description"
                    v-model="form.description"
                    label="Aprašymas"
                    :error="form.errors.description"
                    wrapper-class="lg:col-span-2"
                    rows="8"
                    placeholder="Aprašykite renginio eigą ir ko tikėtis"
                />
            </section>

            <AdminImageManager
                v-model="images"
                title="Renginio nuotrauka"
                hint="Galite pasirinkti vieną viršelio nuotrauką. Ji bus rodoma viešame renginio atvaizde."
                :multiple="false"
                :error="form.errors.image_order"
                :item-error="form.errors['images.0'] || form.errors.images"
            />

            <div class="flex flex-col gap-3 sm:flex-row sm:justify-end">
                <CButton
                    :href="route('admin.events.index', {}, false)"
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
