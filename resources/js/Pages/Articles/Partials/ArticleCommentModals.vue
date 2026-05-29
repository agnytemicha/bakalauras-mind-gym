<script setup>
import CButton from "../../../Components/UI/CButton.vue";
import CModal from "../../../Components/UI/CModal.vue";
import CTextarea from "../../../Components/UI/CTextarea.vue";

defineProps(["activeModal", "form"]);

defineEmits(["close", "login", "submit"]);
</script>

<template>
    <CModal
        :open="activeModal === 'comment-auth'"
        max-width-class="max-w-120"
        actions-class="mt-6 flex flex-wrap justify-center gap-3"
        @close="$emit('close')"
    >
        <template #default>
            <p
                class="pr-8 text-center font-sans text-lg font-semibold leading-[1.28] text-black"
            >
                Norėdami palikti komentarą - prisijunkite!
            </p>
        </template>

        <template #actions>
            <CButton variant="danger" @click="$emit('login')">
                Prisijungti
            </CButton>
        </template>
    </CModal>

    <CModal
        :open="activeModal === 'comment-form' || activeModal === 'reply-form'"
        title="Komentaras"
        max-width-class="max-w-136"
        @close="$emit('close')"
    >
        <template #default>
            <form
                id="article-comment-form"
                class="space-y-4"
                @submit.prevent="$emit('submit')"
            >
                <CTextarea
                    v-model="form.body"
                    label="Komentaras"
                    :error="form.errors.body"
                    rows="5"
                    :placeholder="
                        activeModal === 'reply-form'
                            ? 'Parašyk savo komentarą apie šį komentarą'
                            : 'Kas jums pasirodė naudinga arba ko dar pasigedote?'
                    "
                />
            </form>
        </template>

        <template #actions>
            <CButton
                type="submit"
                form="article-comment-form"
                variant="danger"
                :disabled="form.processing"
            >
                Pateikti komentarą
            </CButton>
        </template>
    </CModal>
</template>
