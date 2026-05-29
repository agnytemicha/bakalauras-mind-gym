<script setup>
import CButton from "../../../Components/UI/CButton.vue";
import CRatingStars from "../../../Components/UI/CRatingStars.vue";
import commentIconSrc from "@icons/content/comment.svg";
import noPhotoIconSrc from "@icons/content/no-photo.svg";

defineProps(["reviews"]);

const emit = defineEmits(["add-review", "comment-review"]);
</script>

<template>
    <section class="section-shell mt-10">
        <div
            class="rounded-4xl bg-mg-neutral p-6 shadow-md sm:p-8"
        >
            <p class="font-display text-3xl uppercase text-black">
                Atsiliepimai
            </p>

            <div v-if="reviews.length" class="mt-6 space-y-4">
                <article
                    v-for="review in reviews"
                    :key="review.id"
                    class="rounded-2xl bg-mg-light-gray px-5 py-4 shadow-md"
                >
                    <div
                        class="flex flex-wrap items-start justify-between gap-4"
                    >
                        <div class="flex items-start gap-3">
                            <div
                                :class="
                                    review.user.hasPhoto
                                        ? 'bg-white'
                                        : 'bg-mg-neutral'
                                "
                                class="flex h-[50px] w-[50px] shrink-0 items-center justify-center overflow-hidden rounded-xl"
                            >
                                <img
                                    :src="
                                        review.user.hasPhoto
                                            ? review.user.photoUrl
                                            : noPhotoIconSrc
                                    "
                                    :class="
                                        review.user.hasPhoto
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
                                    {{ review.user.displayName }}
                                </p>
                                <p
                                    class="font-sans text-base font-bold leading-none text-mg-muted-gray"
                                >
                                    {{ review.user.usernameLabel }}
                                </p>
                            </div>
                        </div>
                        <CRatingStars
                            :rating="review.rating"
                            class="justify-end gap-1"
                            icon-class="h-[20px] w-[20px] object-contain"
                        />
                    </div>
                    <p class="mt-3 text-base leading-7 text-black">
                        {{ review.body }}
                    </p>
                    <div
                        class="mt-4 flex justify-end border-t border-black/10 pt-3"
                    >
                        <div class="flex flex-col items-end gap-2">
                            <p class="text-xs font-semibold text-black">
                                {{ review.createdAtLabel }}
                            </p>
                        </div>
                    </div>

                    <div v-if="review.comments.length" class="mt-4 space-y-3">
                        <article
                            v-for="comment in review.comments"
                            :key="comment.id"
                            class="rounded-xl bg-mg-neutral px-4 py-3 shadow-md"
                        >
                            <div>
                                <p
                                    class="font-sans text-base font-bold leading-none text-black"
                                >
                                    {{ comment.user.displayName }}
                                </p>
                                <p
                                    class="mt-1 font-sans text-[13px] font-bold leading-none text-mg-muted-gray"
                                >
                                    {{ comment.user.usernameLabel }}
                                </p>
                            </div>
                            <p class="mt-3 text-sm leading-6 text-black">
                                {{ comment.body }}
                            </p>
                            <div class="mt-3 flex justify-end">
                                <p class="text-xs font-semibold text-black">
                                    {{ comment.createdAtLabel }}
                                </p>
                            </div>
                        </article>
                    </div>

                    <div class="mt-4 flex justify-end">
                        <button
                            type="button"
                            class="inline-flex h-6 w-6 items-center justify-center rounded-full transition duration-200 hover:-translate-y-0.5"
                            @click="emit('comment-review', review)"
                        >
                            <img
                                :src="commentIconSrc"
                                class="h-[15px] w-[15px] object-contain"
                            />
                        </button>
                    </div>
                </article>
            </div>

            <p v-else class="mt-6 text-sm leading-7 text-zinc-700">
                Kol kas atsiliepimų dar nėra. Būk pirmas, kuris pasidalins
                įspūdžiu.
            </p>

            <div class="mt-6 flex justify-end">
                <CButton variant="primary" @click="emit('add-review')">
                    Palik savo atsiliepimą
                </CButton>
            </div>
        </div>
    </section>
</template>
