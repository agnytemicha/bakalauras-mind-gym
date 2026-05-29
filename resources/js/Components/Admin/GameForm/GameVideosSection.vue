<script setup>
import { computed } from "vue";
import CFieldHelpTooltip from "../../UI/CFieldHelpTooltip.vue";
import CTextInput from "../../UI/CTextInput.vue";
import deleteTipIconSrc from "@icons/actions/delete.svg";

const props = defineProps(["form"]);

defineEmits(["add-block", "remove-block"]);

const hasReachedVideoLimit = computed(
    () => props.form.video_blocks.length >= 3,
);
</script>

<template>
    <section>
        <div class="flex items-center gap-2">
            <p
                class="mb-0 block font-sans text-[1.35rem] font-bold leading-none text-black"
            >
                Vaizdo įrašai
            </p>
            <CFieldHelpTooltip
                text="Pridėkite daugiausia 3 vaizdo įrašus apie šį žaidimą."
            />
        </div>
        <p
            v-if="form.errors.video_blocks"
            class="mt-2 font-sans text-sm font-semibold text-red-600"
        >
            {{ form.errors.video_blocks }}
        </p>

        <div v-if="form.video_blocks.length" class="mt-4 space-y-4">
            <article
                v-for="(block, index) in form.video_blocks"
                :key="`video-block-${index}`"
                class="rounded-2xl border border-mg-border-gray bg-white px-4 py-4 shadow-md sm:px-5"
            >
                <div class="flex items-start justify-between gap-4">
                    <p
                        class="font-sans text-[21.6px] font-semibold leading-none text-black"
                    >
                        {{ index + 1 }}. Vaizdo įrašas
                    </p>

                    <button
                        type="button"
                        class="inline-flex h-10 w-10 items-center justify-center transition duration-200 hover:-translate-y-0.5 hover:opacity-80"
                        @click="$emit('remove-block', index)"
                    >
                        <img
                            :src="deleteTipIconSrc"
                            class="h-5 w-5 object-contain"
                        />
                    </button>
                </div>

                <div class="mt-4 grid gap-4">
                    <CTextInput
                        :id="`game-video-title-${index}`"
                        v-model="form.video_blocks[index].title"
                        label="Pavadinimas"
                        :error="form.errors[`video_blocks.${index}.title`]"
                        placeholder="Pvz. Kaip laimėti pirmą partiją"
                    />

                    <CTextInput
                        :id="`game-video-author-${index}`"
                        v-model="form.video_blocks[index].author"
                        label="Autorius"
                        :error="form.errors[`video_blocks.${index}.author`]"
                        placeholder="Pvz. Mind Gym"
                    />

                    <CTextInput
                        :id="`game-video-url-${index}`"
                        v-model="form.video_blocks[index].youtube_url"
                        label="YouTube URL"
                        :error="
                            form.errors[`video_blocks.${index}.youtube_url`]
                        "
                        placeholder="https://www.youtube.com/watch?v=..."
                    />
                </div>
            </article>
        </div>

        <div
            v-else
            class="mt-4 rounded-2xl border border-dashed border-mg-neutral px-4 py-5 text-center font-sans text-[0.98rem] text-mg-border-gray"
        >
            Vaizdo įrašų dar nepridėta.
        </div>

        <div class="mt-4 flex items-center gap-3">
            <button
                type="button"
                class="inline-flex h-10 w-10 items-center justify-center rounded-full bg-mg-blue font-sans text-[1.7rem] leading-none text-black shadow-md transition duration-200 hover:-translate-y-0.5 hover:bg-mg-soft-blue"
                :class="
                    hasReachedVideoLimit
                        ? 'cursor-not-allowed opacity-50 hover:translate-y-0 hover:bg-mg-blue'
                        : ''
                "
                :disabled="hasReachedVideoLimit"
                @click="$emit('add-block')"
            >
                +
            </button>
            <p class="font-sans text-[0.98rem] italic text-mg-border-gray">
                Pridėti dar vieną vaizdo įrašą
            </p>
        </div>
    </section>
</template>
