<script setup>
import CButton from "./UI/CButton.vue";
import mascotSrc from "@images/illustrations/characters/character-and-bubble.svg";

const emit = defineEmits(["login"]);
</script>

<template>
    <div class="relative w-[260px] self-end sm:w-[320px] xl:w-[462px]">
        <img :src="mascotSrc" class="h-auto w-full object-contain" />

        <div
            class="absolute right-[2%] top-[4%] flex h-[56%] w-[58%] translate-x-[30px] -translate-y-[15px] flex-col items-center justify-center px-5 text-center sm:px-7 xl:right-[1%] xl:top-[3%] xl:h-[58%] xl:w-[58%] xl:px-8"
        >
            <p
                class="max-w-31 font-display text-[1.1rem] uppercase leading-[0.95] text-black sm:max-w-36 sm:text-[1.35rem] xl:max-w-42 xl:text-[1.625rem]"
            >
                MANKŠTINK SMEGENIS IR TU!
            </p>

            <div class="mt-2 xl:mt-3">
                <CButton
                    variant="accent"
                    class="!rounded-xl !px-3 !py-1.5 !text-sm !leading-none sm:!px-3.5 sm:!py-2 sm:!text-base xl:!px-4 xl:!text-base"
                    @click="emit('login')"
                >
                    PRISIJUNK!
                </CButton>
            </div>
        </div>
    </div>
</template>
