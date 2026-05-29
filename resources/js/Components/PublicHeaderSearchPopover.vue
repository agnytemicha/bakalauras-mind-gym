<script setup>
import { Link } from "@inertiajs/vue3";
import { computed, ref } from "vue";
import noPhotoIconSrc from "@icons/content/no-photo.svg";

const props = defineProps({
    open: {
        type: Boolean,
        default: false,
    },
    modelValue: {
        type: String,
        default: "",
    },
    loading: {
        type: Boolean,
        default: false,
    },
    error: {
        type: String,
        default: "",
    },
    sections: {
        type: Array,
        default: () => [],
    },
    anchorX: {
        type: Number,
        default: null,
    },
});

const emit = defineEmits(["update:modelValue", "select"]);

const searchInputRef = ref(null);
const searchPanelRef = ref(null);

const hasEnoughCharacters = computed(() => props.modelValue.trim().length >= 2);
const shouldShowSearchFeedback = computed(
    () => props.loading || props.error || hasEnoughCharacters.value,
);
const showEmptyState = computed(
    () =>
        hasEnoughCharacters.value &&
        !props.loading &&
        !props.error &&
        props.sections.length === 0,
);
const panelPositionStyle = computed(() => {
    return {
        "--public-header-search-anchor-x":
            props.anchorX === null
                ? "50vw"
                : `clamp(14rem, ${props.anchorX}px, calc(100vw - 14rem))`,
    };
});

function focusInput() {
    searchInputRef.value?.focus();
}

function contains(target) {
    return Boolean(searchPanelRef.value?.contains(target));
}

function updateSearchQuery(event) {
    emit("update:modelValue", event.target.value);
}

defineExpose({ focusInput, contains });
</script>

<template>
    <Teleport to="body">
        <div
            v-if="open"
            ref="searchPanelRef"
            class="fixed left-3 right-3 top-[4.85rem] z-50 max-h-[calc(100vh-6rem)] overflow-y-auto rounded-2xl bg-mg-panel-gray p-3 shadow-md sm:left-[var(--public-header-search-anchor-x)] sm:right-auto sm:top-[5.35rem] sm:w-[25rem] sm:-translate-x-1/2 sm:p-3.5"
            :style="panelPositionStyle"
        >
            <div
                class="rounded-xl border border-mg-border-gray bg-white px-4 py-2.5 transition focus-within:border-black focus-within:ring-2 focus-within:ring-black/10 sm:px-4.5"
            >
                <input
                    id="public-header-search"
                    ref="searchInputRef"
                    :value="modelValue"
                    type="text"
                    class="w-full bg-white font-sans text-[1.05rem] font-semibold text-black outline-none placeholder:text-[#696969] sm:text-[1.12rem]"
                    placeholder="Ieškokite žaidimų, straipsnių, renginių..."
                    @input="updateSearchQuery"
                />
            </div>

            <div v-if="shouldShowSearchFeedback" class="mt-3 space-y-3">
                <p
                    v-if="loading"
                    class="rounded-xl bg-white px-4 py-3 text-center font-sans text-base font-semibold text-black"
                >
                    Krauname rezultatus...
                </p>

                <p
                    v-else-if="error"
                    class="rounded-xl bg-white px-4 py-3 text-center font-sans text-base font-semibold text-black"
                >
                    {{ error }}
                </p>

                <template v-else>
                    <section
                        v-for="section in sections"
                        :key="section.key"
                        class="space-y-2.5"
                    >
                        <p
                            class="font-sans text-lg font-semibold leading-none text-black"
                        >
                            {{ section.title }}
                        </p>

                        <div class="grid gap-2.5">
                            <Link
                                v-for="item in section.items"
                                :key="item.key"
                                :href="item.href"
                                class="flex items-center gap-3 rounded-xl bg-white px-3.5 py-2.5 transition duration-200 hover:-translate-y-0.5"
                                @click="emit('select', item)"
                            >
                                <div
                                    class="flex h-14 w-14 shrink-0 items-center justify-center overflow-hidden rounded-[0.65rem]"
                                    :class="
                                        item.image
                                            ? 'bg-[#ececec]'
                                            : 'bg-mg-neutral'
                                    "
                                >
                                    <img
                                        v-if="item.image"
                                        :src="item.image"
                                        class="h-full w-full object-cover"
                                    />
                                    <img
                                        v-else
                                        :src="noPhotoIconSrc"
                                        class="h-8 w-8 object-contain"
                                    />
                                </div>

                                <p
                                    class="flex-1 pr-1 text-left font-display text-[1.12rem] uppercase leading-none text-black sm:text-[1.2rem]"
                                >
                                    {{ item.title }}
                                </p>
                            </Link>
                        </div>
                    </section>

                    <div
                        v-if="showEmptyState"
                        class="rounded-xl bg-white px-4 py-5 text-center"
                    >
                        <p
                            class="font-sans text-[1.05rem] font-semibold italic leading-none text-black"
                        >
                            Nieko nerasta
                        </p>
                    </div>
                </template>
            </div>
        </div>
    </Teleport>
</template>
