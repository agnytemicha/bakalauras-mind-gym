<script setup>
import deleteIconSrc from "@icons/actions/delete.svg";

defineOptions({
    name: "ContactMessageCard",
});

const { message, expanded } = defineProps(["message", "expanded"]);

const emit = defineEmits(["open", "delete"]);
</script>

<template>
    <article
        class="w-full rounded-2xl border border-mg-border-gray bg-white shadow-md"
        :class="
            expanded
                ? 'p-6 sm:p-8'
                : 'cursor-pointer p-5 transition duration-200 hover:-translate-y-0.5 sm:p-6'
        "
        @click="expanded || emit('open', message)"
    >
        <div
            class="grid gap-4 sm:grid-cols-[minmax(0,1fr)_auto] sm:items-start"
        >
            <div class="min-w-0">
                <div class="min-w-0 pt-0.5">
                    <p
                        class="font-sans text-xl font-bold leading-none text-black"
                    >
                        {{ message.name }}
                    </p>
                    <p
                        class="mt-1 break-all font-sans text-base font-bold leading-none text-mg-muted-gray"
                    >
                        {{ message.email }}
                    </p>
                </div>

                <p
                    class="mt-4 whitespace-pre-wrap break-words font-sans text-base font-semibold leading-7 text-black [overflow-wrap:anywhere] sm:text-lg"
                    :class="
                        expanded
                            ? ''
                            : 'overflow-hidden text-ellipsis [display:-webkit-box] [-webkit-box-orient:vertical] [-webkit-line-clamp:3]'
                    "
                >
                    {{ message.message }}
                </p>
            </div>

            <div
                class="flex items-end justify-between gap-3 border-t border-black/10 pt-3 sm:min-h-full sm:min-w-28 sm:flex-col sm:items-end sm:justify-between sm:border-t-0 sm:pt-0"
            >
                <p
                    class="font-sans text-sm font-semibold text-mg-text-gray sm:text-right"
                >
                    {{ message.createdAtLabel }}
                </p>

                <button
                    type="button"
                    class="inline-flex h-12 w-12 shrink-0 items-center justify-center rounded-2xl transition duration-200 hover:-translate-y-0.5 hover:opacity-80"
                    @click.stop="emit('delete', message)"
                >
                    <img :src="deleteIconSrc" class="h-6 w-6 object-contain" />
                </button>
            </div>
        </div>
    </article>
</template>
