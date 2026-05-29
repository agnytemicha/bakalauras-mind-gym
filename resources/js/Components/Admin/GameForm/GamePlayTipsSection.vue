<script setup>
import CFieldHelpTooltip from "../../UI/CFieldHelpTooltip.vue";
import CTextInput from "../../UI/CTextInput.vue";
import CTextarea from "../../UI/CTextarea.vue";
import deleteTipIconSrc from "@icons/actions/delete.svg";

defineProps(["form"]);

defineEmits(["add-block", "remove-block"]);
</script>

<template>
    <section>
        <div class="flex items-center gap-2">
            <p
                class="mb-0 block font-sans text-[1.35rem] font-bold leading-none text-black"
            >
                Trumpi patarimai
            </p>
            <CFieldHelpTooltip
                text="Pridėkite atskirus patarimų blokus su pavadinimu ir trumpu paaiškinimu."
            />
        </div>
        <p
            v-if="form.errors.play_tip_blocks"
            class="mt-2 font-sans text-sm font-semibold text-red-600"
        >
            {{ form.errors.play_tip_blocks }}
        </p>

        <div v-if="form.play_tip_blocks.length" class="mt-4 space-y-4">
            <article
                v-for="(block, index) in form.play_tip_blocks"
                :key="`play-tip-${index}`"
                class="rounded-2xl border border-mg-border-gray bg-white px-4 py-4 shadow-md sm:px-5"
            >
                <div class="flex items-start justify-between gap-4">
                    <p
                        class="font-sans text-[21.6px] font-semibold leading-none text-black"
                    >
                        {{ index + 1 }}. Patarimas
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
                        :id="`game-play-tip-title-${index}`"
                        v-model="form.play_tip_blocks[index].title"
                        label="Pavadinimas"
                        :error="form.errors[`play_tip_blocks.${index}.title`]"
                        placeholder="Pvz. Pradėkite nuo lengvesnio raundo"
                    />

                    <CTextarea
                        :id="`game-play-tip-body-${index}`"
                        v-model="form.play_tip_blocks[index].body"
                        label="Tekstas"
                        :error="form.errors[`play_tip_blocks.${index}.body`]"
                        rows="4"
                        placeholder="Įrašykite trumpą patarimo paaiškinimą"
                    />
                </div>
            </article>
        </div>

        <div
            v-else
            class="mt-4 rounded-2xl border border-dashed border-mg-neutral px-4 py-5 text-center font-sans text-[0.98rem] text-mg-border-gray"
        >
            Trumpų patarimų dar nepridėta.
        </div>

        <div class="mt-4 flex items-center gap-3">
            <button
                type="button"
                class="inline-flex h-10 w-10 items-center justify-center rounded-full bg-mg-blue font-sans text-[1.7rem] leading-none text-black shadow-md transition duration-200 hover:-translate-y-0.5 hover:bg-mg-soft-blue"
                @click="$emit('add-block')"
            >
                +
            </button>
            <p class="font-sans text-[0.98rem] italic text-mg-border-gray">
                Pridėti dar vieną patarimą
            </p>
        </div>
    </section>
</template>
