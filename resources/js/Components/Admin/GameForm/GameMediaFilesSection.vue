<script setup>
import AdminImageManager from "../AdminImageManager.vue";
import CButton from "../../UI/CButton.vue";
import CFieldHelpTooltip from "../../UI/CFieldHelpTooltip.vue";
import deleteTipIconSrc from "@icons/actions/delete.svg";

defineProps(["form", "images", "existingRuleBooks"]);

defineEmits([
    "update:images",
    "update-files",
    "remove-new-file",
    "remove-existing-rule-book",
]);
</script>

<template>
    <section class="grid items-start gap-8 xl:grid-cols-2">
        <AdminImageManager
            title="Įkelti nuotraukas"
            hint="Galima įkelti iki 10 nuotraukų."
            :model-value="images"
            :error="form.errors.image_order"
            :item-error="form.errors['images.0'] || form.errors.images"
            @update:model-value="$emit('update:images', $event)"
        />

        <div class="rounded-2xl border border-mg-border-gray p-5 sm:p-6">
            <div class="flex items-center justify-between gap-4">
                <div>
                    <div class="flex items-center gap-2">
                        <p
                            class="mb-0 block font-sans text-[1.35rem] font-bold leading-none text-black"
                        >
                            Įkelti taisykles
                        </p>
                        <CFieldHelpTooltip
                            text="Galima įkelti iki 5 PDF taisyklių failų."
                        />
                    </div>
                </div>

                <label
                    class="inline-flex cursor-pointer items-center justify-center rounded-2xl bg-mg-yellow px-4 py-2 font-sans text-[0.86rem] font-medium text-slate-950 shadow-md transition duration-200 hover:-translate-y-0.5 hover:bg-mg-soft-yellow"
                >
                    Pasirinkti
                    <input
                        type="file"
                        class="hidden"
                        accept=".pdf"
                        multiple
                        @change="$emit('update-files', 'rule_books', $event)"
                    />
                </label>
            </div>

            <p
                v-if="form.errors.rule_books"
                class="mt-4 font-sans text-sm font-semibold text-red-600"
            >
                {{ form.errors.rule_books }}
            </p>
            <p
                v-if="form.errors['rule_books.0']"
                class="mt-2 font-sans text-sm font-semibold text-red-600"
            >
                {{ form.errors["rule_books.0"] }}
            </p>

            <div v-if="existingRuleBooks.length" class="mt-5 space-y-3">
                <p class="font-sans text-[1.2rem] font-bold text-slate-900">
                    Esami failai
                </p>
                <article
                    v-for="file in existingRuleBooks"
                    :key="file.path"
                    class="flex flex-col gap-3 rounded-2xl border border-mg-neutral bg-white px-4 py-3 sm:flex-row sm:items-center sm:justify-between"
                >
                    <div>
                        <p
                            class="break-all font-sans text-base font-bold text-slate-900"
                        >
                            {{ file.name }}
                        </p>
                        <a
                            :href="file.url"
                            target="_blank"
                            rel="noreferrer"
                            class="font-sans text-[0.98rem] font-semibold text-slate-900 underline underline-offset-4 transition duration-200 hover:text-slate-600"
                            >Peržiūrėti failą</a
                        >
                    </div>

                    <button
                        type="button"
                        class="inline-flex h-11 w-11 items-center justify-center rounded-xl transition duration-200 hover:-translate-y-0.5 hover:opacity-80"
                        @click="$emit('remove-existing-rule-book', file.path)"
                    >
                        <img
                            :src="deleteTipIconSrc"
                            class="h-6 w-6 object-contain"
                        />
                    </button>
                </article>
            </div>

            <div v-if="form.rule_books.length" class="mt-5 space-y-3">
                <p class="font-sans text-[1.2rem] font-bold text-slate-900">
                    Nauji failai
                </p>
                <article
                    v-for="(file, index) in form.rule_books"
                    :key="`${file.name}-${index}`"
                    class="flex flex-col gap-3 rounded-2xl border border-mg-neutral bg-white px-4 py-3 sm:flex-row sm:items-center sm:justify-between"
                >
                    <div>
                        <p
                            class="break-all font-sans text-base font-bold text-slate-900"
                        >
                            {{ file.name }}
                        </p>
                        <p
                            class="mt-1 break-all font-sans text-sm italic text-mg-border-gray"
                        >
                            {{ Math.round(file.size / 1024) }} KB
                        </p>
                    </div>

                    <CButton
                        variant="outline"
                        @click="$emit('remove-new-file', 'rule_books', index)"
                    >
                        Atšaukti
                    </CButton>
                </article>
            </div>
        </div>
    </section>
</template>
