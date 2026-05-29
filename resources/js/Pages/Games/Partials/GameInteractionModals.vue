<script setup>
import CButton from "../../../Components/UI/CButton.vue";
import CModal from "../../../Components/UI/CModal.vue";
import CSelect from "../../../Components/UI/CSelect.vue";
import CTextarea from "../../../Components/UI/CTextarea.vue";

const { activeModal, reviewForm, reviewCommentForm } = defineProps([
    "activeModal",
    "reviewForm",
    "reviewCommentForm",
]);

const emit = defineEmits(["close", "login", "submit-review", "submit-comment"]);
</script>

<template>
    <CModal
        :open="
            ['owned', 'wishlist', 'favorite', 'review-auth'].includes(
                activeModal,
            )
        "
        max-width-class="max-w-120"
        actions-class="mt-6 flex flex-wrap justify-center gap-3"
        @close="emit('close')"
    >
        <template #default>
            <p
                class="pr-8 text-center font-sans text-lg font-semibold leading-[1.28] text-black"
            >
                <span v-if="activeModal === 'owned'">
                    Norėdami pridėti žaidimą - prisijunkite!
                </span>
                <span v-else-if="activeModal === 'wishlist'">
                    Norėdami pridėti žaidimą į norų sąrašą - prisijunkite!
                </span>
                <span v-else-if="activeModal === 'favorite'">
                    Norėdami pridėti žaidimą į mėgstamiausius - prisijunkite!
                </span>
                <span v-else>
                    Norėdamas palikti atsiliepimą ar komentarą - prisijunk!
                </span>
            </p>
        </template>

        <template #actions>
            <CButton variant="danger" @click="emit('login')">
                Prisijungti
            </CButton>
        </template>
    </CModal>

    <CModal
        :open="activeModal === 'review-form'"
        title="Atsiliepimas"
        max-width-class="max-w-136"
        @close="emit('close')"
    >
        <template #default>
            <form
                id="game-review-form"
                class="space-y-4"
                @submit.prevent="emit('submit-review')"
            >
                <CSelect
                    v-model="reviewForm.rating"
                    label="Įvertinimas"
                    :error="reviewForm.errors.rating"
                >
                    <option :value="5">5 žvaigždutės</option>
                    <option :value="4">4 žvaigždutės</option>
                    <option :value="3">3 žvaigždutės</option>
                    <option :value="2">2 žvaigždutės</option>
                    <option :value="1">1 žvaigždutė</option>
                </CSelect>

                <CTextarea
                    v-model="reviewForm.body"
                    label="Komentaras"
                    :error="reviewForm.errors.body"
                    rows="5"
                    placeholder="Kuo šis žaidimas patiko arba nustebino?"
                />
            </form>
        </template>

        <template #actions>
            <CButton
                type="submit"
                form="game-review-form"
                variant="danger"
                :disabled="reviewForm.processing"
            >
                Pateikti atsiliepimą
            </CButton>
        </template>
    </CModal>

    <CModal
        :open="activeModal === 'review-comment-form'"
        title="Komentaras"
        max-width-class="max-w-136"
        @close="emit('close')"
    >
        <template #default>
            <form
                id="game-review-comment-form"
                class="space-y-4"
                @submit.prevent="emit('submit-comment')"
            >
                <CTextarea
                    v-model="reviewCommentForm.body"
                    label="Komentaras"
                    :error="reviewCommentForm.errors.body"
                    rows="5"
                    placeholder="Parašyk savo komentarą apie šį atsiliepimą"
                />
            </form>
        </template>

        <template #actions>
            <CButton
                type="submit"
                form="game-review-comment-form"
                variant="danger"
                :disabled="reviewCommentForm.processing"
            >
                Pateikti komentarą
            </CButton>
        </template>
    </CModal>
</template>
