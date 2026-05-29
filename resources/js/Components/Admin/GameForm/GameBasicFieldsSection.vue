<script setup>
import { computed } from "vue";
import CCheckbox from "../../UI/CCheckbox.vue";
import CFieldHelpTooltip from "../../UI/CFieldHelpTooltip.vue";
import CNumberInput from "../../UI/CNumberInput.vue";
import CRadioOption from "../../UI/CRadioOption.vue";
import CSelect from "../../UI/CSelect.vue";
import CTextInput from "../../UI/CTextInput.vue";
import CTextarea from "../../UI/CTextarea.vue";

const props = defineProps(["form", "tags", "difficultyOptions"]);

const isExactPlayersMode = computed(() => props.form.players_mode === "exact");
</script>

<template>
    <section>
        <div class="grid gap-5 lg:grid-cols-2">
            <CTextInput
                id="game-title"
                v-model="form.title"
                label="Pavadinimas"
                :error="form.errors.title"
                wrapper-class="lg:col-span-2"
                placeholder="Įrašykite stalo žaidimo pavadinimą"
            />

            <div class="lg:col-span-2">
                <div class="flex items-center gap-2">
                    <p
                        class="mb-0 block font-sans text-[1.35rem] font-bold leading-none text-black"
                    >
                        Kategorijos
                    </p>
                    <CFieldHelpTooltip
                        text="Galima pasirinkti daugiausia 4 kategorijas."
                    />
                </div>
                <div class="mt-3 grid gap-3 sm:grid-cols-2 xl:grid-cols-3">
                    <CCheckbox
                        v-for="tag in tags"
                        :key="tag.id"
                        v-model="form.tag_ids"
                        :value="tag.id"
                        :label="tag.name"
                        :caption="tag.slug"
                    />
                </div>
                <p
                    v-if="form.errors.tag_ids"
                    class="mt-2 font-sans text-sm font-semibold text-red-600"
                >
                    {{ form.errors.tag_ids }}
                </p>
            </div>

            <CNumberInput
                id="game-duration"
                v-model="form.duration_minutes"
                label="Trukmė"
                hint="Įrašykite žaidimo trukmę minutėmis."
                :error="form.errors.duration_minutes"
                min="10"
                max="300"
                placeholder="Pvz. 45"
            />

            <CNumberInput
                id="game-age"
                v-model="form.age_rating"
                label="Amžius"
                hint="Minimalus rekomenduojamas amžius."
                :error="form.errors.age_rating"
                min="4"
                max="21"
                placeholder="Pvz. 10"
            />

            <div class="lg:col-span-2">
                <p
                    class="mb-2 block font-sans text-[1.35rem] font-bold leading-none text-black"
                >
                    Žaidėjų skaičius
                </p>
                <div class="mt-3 grid gap-3 sm:grid-cols-2">
                    <CRadioOption
                        id="game-players-mode-exact"
                        v-model="form.players_mode"
                        name="players_mode"
                        value="exact"
                        label="Tikslus skaičius"
                    />
                    <CRadioOption
                        id="game-players-mode-range"
                        v-model="form.players_mode"
                        name="players_mode"
                        value="range"
                        label="Nuo - iki"
                    />
                </div>

                <p
                    v-if="form.errors.players_mode"
                    class="mt-2 font-sans text-sm font-semibold text-red-600"
                >
                    {{ form.errors.players_mode }}
                </p>

                <div class="mt-4">
                    <div
                        v-if="isExactPlayersMode"
                        class="grid gap-4 sm:max-w-sm"
                    >
                        <CNumberInput
                            id="game-players-exact"
                            v-model="form.min_players"
                            label="Skaičius"
                            :error="form.errors.min_players"
                            min="1"
                            max="20"
                            placeholder="Pvz. 4"
                        />
                    </div>

                    <div v-else class="grid gap-4 sm:grid-cols-2">
                        <CNumberInput
                            id="game-players-min"
                            v-model="form.min_players"
                            label="Nuo"
                            :error="form.errors.min_players"
                            min="1"
                            max="20"
                            placeholder="Pvz. 2"
                        />

                        <CNumberInput
                            id="game-players-max"
                            v-model="form.max_players"
                            label="Iki"
                            :error="form.errors.max_players"
                            min="1"
                            max="20"
                            placeholder="Pvz. 6"
                        />
                    </div>
                </div>
            </div>

            <CSelect
                id="game-difficulty"
                v-model="form.difficulty"
                label="Sunkumas"
                :error="form.errors.difficulty"
            >
                <option
                    v-for="option in difficultyOptions"
                    :key="option"
                    :value="option"
                >
                    {{ option }}
                </option>
            </CSelect>

            <CCheckbox
                id="game-featured"
                v-model="form.featured"
                label="Rodyti kaip TOP žaidimą"
                :error="form.errors.featured"
                wrapper-class="lg:col-span-2"
            />

            <CTextarea
                id="game-description"
                v-model="form.description"
                label="Aprašymas"
                :error="form.errors.description"
                wrapper-class="lg:col-span-2"
                rows="8"
                placeholder="Parašykite išsamų žaidimo aprašymą"
            />
            <CTextarea
                id="game-rules"
                v-model="form.rules"
                label="Kaip žaisti"
                :error="form.errors.rules"
                wrapper-class="lg:col-span-2"
                rows="8"
                placeholder="Paaiškinkite, kaip žaisti šį stalo žaidimą"
            />
        </div>
    </section>
</template>
