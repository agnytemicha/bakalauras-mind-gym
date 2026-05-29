<script setup>
import CButton from "../../../Components/UI/CButton.vue";
import commentIconSrc from "@icons/content/comment.svg";
import noPhotoIconSrc from "@icons/content/no-photo.svg";

defineProps(["comments"]);

defineEmits(["add-comment", "reply"]);
</script>

<template>
    <section class="section-shell mt-10">
        <div
            class="rounded-4xl bg-mg-neutral p-6 shadow-md sm:p-8"
        >
            <p class="font-display text-3xl uppercase text-black">Komentarai</p>

            <div v-if="comments.length" class="mt-6 space-y-4">
                <article
                    v-for="comment in comments"
                    :key="comment.id"
                    class="rounded-2xl bg-mg-light-gray px-5 py-4 shadow-md"
                >
                    <div class="flex flex-wrap items-start gap-4">
                        <div class="flex items-start gap-3">
                            <div
                                :class="
                                    comment.user.hasPhoto
                                        ? 'bg-white'
                                        : 'bg-mg-neutral'
                                "
                                class="flex h-[50px] w-[50px] shrink-0 items-center justify-center overflow-hidden rounded-xl"
                            >
                                <img
                                    :src="
                                        comment.user.hasPhoto
                                            ? comment.user.photoUrl
                                            : noPhotoIconSrc
                                    "
                                    :class="
                                        comment.user.hasPhoto
                                            ? 'h-full w-full object-cover'
                                            : 'h-[58%] w-[58%] object-contain'
                                    "
                                />
                            </div>
                            <div
                                class="flex min-w-0 flex-col items-start gap-0.5 pt-0.5"
                            >
                                <p
                                    class="font-sans text-xl font-bold leading-none text-black"
                                >
                                    {{ comment.user.displayName }}
                                </p>
                                <p
                                    class="font-sans text-base font-bold leading-none text-mg-muted-gray"
                                >
                                    {{ comment.user.usernameLabel }}
                                </p>
                            </div>
                        </div>
                    </div>

                    <p class="mt-3 text-base leading-7 text-black">
                        {{ comment.body }}
                    </p>

                    <div
                        class="mt-4 flex justify-end border-t border-black/10 pt-3"
                    >
                        <div class="flex flex-col items-end gap-2">
                            <p class="text-xs font-semibold text-black">
                                {{ comment.createdAtLabel }}
                            </p>
                            <button
                                type="button"
                                class="inline-flex h-6 w-6 items-center justify-center rounded-full transition duration-200 hover:-translate-y-0.5"
                                @click="$emit('reply', comment)"
                            >
                                <img
                                    :src="commentIconSrc"
                                    class="h-[15px] w-[15px] object-contain"
                                />
                            </button>
                        </div>
                    </div>

                    <div v-if="comment.replies.length" class="mt-4 space-y-3">
                        <article
                            v-for="reply in comment.replies"
                            :key="reply.id"
                            class="rounded-xl bg-mg-neutral px-4 py-3 shadow-md"
                        >
                            <div>
                                <p
                                    class="font-sans text-base font-bold leading-none text-black"
                                >
                                    {{ reply.user.displayName }}
                                </p>
                                <p
                                    class="mt-1 font-sans text-[13px] font-bold leading-none text-mg-muted-gray"
                                >
                                    {{ reply.user.usernameLabel }}
                                </p>
                            </div>
                            <p class="mt-3 text-sm leading-6 text-black">
                                {{ reply.body }}
                            </p>
                            <div class="mt-3 flex justify-end">
                                <p class="text-xs font-semibold text-black">
                                    {{ reply.createdAtLabel }}
                                </p>
                            </div>
                        </article>
                    </div>
                </article>
            </div>

            <p v-else class="mt-6 text-sm leading-7 text-zinc-700">
                Kol kas komentarų dar nėra. Būk pirmas, kuris pasidalins
                įspūdžiu.
            </p>

            <div class="mt-6 flex justify-end">
                <CButton variant="primary" @click="$emit('add-comment')">
                    Palik komentarą
                </CButton>
            </div>
        </div>
    </section>
</template>
