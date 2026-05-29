<script setup>
import { onBeforeUnmount } from "vue";
import CFieldHelpTooltip from "../UI/CFieldHelpTooltip.vue";
import arrowIconSrc from "@icons/actions/arrow.svg";
import deleteIconSrc from "@icons/actions/delete.svg";

const props = defineProps({
    modelValue: {
        type: Array,
        required: true,
    },
    title: {
        type: String,
        required: true,
    },
    hint: {
        type: String,
        default: "",
    },
    error: {
        type: String,
        default: "",
    },
    itemError: {
        type: String,
        default: "",
    },
    multiple: {
        type: Boolean,
        default: true,
    },
    accept: {
        type: String,
        default: ".jpg,.jpeg,.png,.webp",
    },
});

const emit = defineEmits(["update:modelValue"]);

function updateImages(images) {
    emit("update:modelValue", images);
}

function queueFiles(event) {
    const selectedFiles = Array.from(event.target.files ?? []);

    if (!selectedFiles.length) {
        return;
    }

    const queuedItems = selectedFiles.map((file) => {
        return createQueuedImage(file);
    });

    if (props.multiple) {
        updateImages([...props.modelValue, ...queuedItems]);
    } else {
        updateImages(replaceWithSingleImage(queuedItems));
    }

    event.target.value = "";
}

function createQueuedImage(file) {
    const key = `${Date.now()}-${Math.random().toString(36).slice(2, 10)}`;

    return {
        id: null,
        key,
        token: `queued:${key}`,
        source: "queued",
        file,
        name: file.name,
        size: file.size,
        sizeLabel: fileSizeLabel(file.size),
        previewUrl: URL.createObjectURL(file),
    };
}

function replaceWithSingleImage(queuedItems) {
    props.modelValue.forEach(revokeQueuedPreview);

    return queuedItems.slice(0, 1);
}

function fileSizeLabel(size) {
    return `${Math.max(1, Math.round(size / 1024))} KB`;
}

function removeImage(item) {
    revokeQueuedPreview(item);

    updateImages(
        props.modelValue.filter((image) => image.token !== item.token),
    );
}

function moveImage(index, direction) {
    const targetIndex = index + direction;

    if (targetIndex < 0 || targetIndex >= props.modelValue.length) {
        return;
    }

    const images = [...props.modelValue];
    const [movedImage] = images.splice(index, 1);
    images.splice(targetIndex, 0, movedImage);

    updateImages(images);
}

function revokeQueuedPreview(image) {
    if (image.source === "queued") {
        URL.revokeObjectURL(image.previewUrl);
    }
}

onBeforeUnmount(() => {
    props.modelValue.forEach(revokeQueuedPreview);
});
</script>

<template>
    <div class="rounded-2xl border border-mg-border-gray p-5 sm:p-6">
        <div class="flex items-center justify-between gap-4">
            <div>
                <div class="flex items-center gap-2">
                    <p
                        class="mb-0 block font-sans text-[1.35rem] font-bold leading-none text-black"
                    >
                        {{ title }}
                    </p>
                    <CFieldHelpTooltip v-if="hint" :text="hint" />
                </div>
            </div>

            <label
                class="inline-flex cursor-pointer items-center justify-center rounded-2xl bg-mg-blue px-4 py-2 font-sans text-[0.86rem] font-medium text-slate-950 shadow-md transition duration-200 hover:-translate-y-0.5 hover:bg-mg-soft-blue"
            >
                Pasirinkti
                <input
                    type="file"
                    class="hidden"
                    :accept="accept"
                    :multiple="multiple"
                    @change="queueFiles"
                />
            </label>
        </div>

        <p
            v-if="error"
            class="mt-2 font-sans text-sm font-semibold text-red-600"
        >
            {{ error }}
        </p>
        <p
            v-if="itemError"
            class="mt-2 font-sans text-sm font-semibold text-red-600"
        >
            {{ itemError }}
        </p>

        <div v-if="modelValue.length" class="mt-5 space-y-3">
            <article
                v-for="(item, index) in modelValue"
                :key="item.token"
                class="flex flex-col gap-3 rounded-2xl border border-mg-neutral bg-white px-4 py-3 sm:flex-row sm:items-center sm:justify-between"
            >
                <div class="flex items-center gap-4">
                    <img
                        :src="item.previewUrl"
                        class="h-20 w-20 rounded-2xl object-cover shadow-md"
                    />

                    <div>
                        <div class="flex flex-wrap items-center gap-2">
                            <span
                                v-if="index === 0"
                                class="inline-flex items-center rounded-full bg-mg-yellow px-3 py-1 font-sans text-[0.78rem] font-semibold uppercase tracking-[0.08em] text-black"
                                >Pagrindinė</span
                            >
                            <span
                                v-if="item.source === 'queued'"
                                class="font-sans text-[0.82rem] font-semibold text-mg-border-gray"
                            >
                                Nauja
                            </span>
                        </div>

                        <p
                            class="mt-2 break-all font-sans text-base font-bold text-slate-900"
                        >
                            {{ item.name }}
                        </p>
                        <p
                            class="mt-1 break-all font-sans text-sm italic text-mg-border-gray"
                        >
                            {{ item.sizeLabel }}
                        </p>
                    </div>
                </div>

                <div class="flex items-center gap-2 self-end sm:self-auto">
                    <div
                        v-if="modelValue.length > 1"
                        class="flex items-center gap-1"
                    >
                        <button
                            type="button"
                            class="inline-flex h-10 w-10 items-center justify-center rounded-xl text-black shadow-md transition duration-200 hover:-translate-y-0.5 hover:opacity-80 disabled:cursor-not-allowed disabled:opacity-35 disabled:hover:translate-y-0"
                            :disabled="index === 0"
                            aria-label="Pakelti nuotrauką aukštyn"
                            title="Pakelti aukštyn"
                            @click="moveImage(index, -1)"
                        >
                            <img
                                :src="arrowIconSrc"
                                class="h-4 w-4 -rotate-90 object-contain"
                                alt=""
                            />
                        </button>

                        <button
                            type="button"
                            class="inline-flex h-10 w-10 items-center justify-center rounded-xl text-black shadow-md transition duration-200 hover:-translate-y-0.5 hover:opacity-80 disabled:cursor-not-allowed disabled:opacity-35 disabled:hover:translate-y-0"
                            :disabled="index === modelValue.length - 1"
                            aria-label="Nuleisti nuotrauką žemyn"
                            title="Nuleisti žemyn"
                            @click="moveImage(index, 1)"
                        >
                            <img
                                :src="arrowIconSrc"
                                class="h-4 w-4 rotate-90 object-contain"
                                alt=""
                            />
                        </button>
                    </div>

                    <button
                        type="button"
                        class="inline-flex h-11 w-11 items-center justify-center rounded-xl transition duration-200 hover:-translate-y-0.5 hover:opacity-80"
                        @click="removeImage(item)"
                    >
                        <img
                            :src="deleteIconSrc"
                            class="h-6 w-6 object-contain"
                        />
                    </button>
                </div>
            </article>
        </div>

        <div v-else class="mt-5">
            <div
                class="rounded-2xl border border-dashed border-mg-neutral px-4 py-5 text-center font-sans text-[0.98rem] text-mg-border-gray"
            >
                Dar nėra įkeltų nuotraukų.
            </div>
        </div>
    </div>
</template>
