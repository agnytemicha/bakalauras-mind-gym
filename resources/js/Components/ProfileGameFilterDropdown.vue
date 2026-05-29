<script setup>
import { onBeforeUnmount, onMounted, ref } from "vue";
import arrowIconSrc from "@icons/actions/arrow.svg";

defineProps(["id", "displayLabel", "options"]);

const emit = defineEmits(["update:modelValue"]);

const rootRef = ref(null);
const isOpen = ref(false);

function closeMenu() {
    isOpen.value = false;
}

function toggleMenu() {
    isOpen.value = !isOpen.value;
}

function selectOption(value) {
    emit("update:modelValue", value);
    closeMenu();
}

function handleDocumentClick(event) {
    if (!isOpen.value || rootRef.value.contains(event.target)) {
        return;
    }

    closeMenu();
}

function handleWindowKeydown(event) {
    if (event.key === "Escape") {
        closeMenu();
    }
}

onMounted(() => {
    document.addEventListener("click", handleDocumentClick);
    window.addEventListener("keydown", handleWindowKeydown);
});

onBeforeUnmount(() => {
    document.removeEventListener("click", handleDocumentClick);
    window.removeEventListener("keydown", handleWindowKeydown);
});
</script>

<template>
    <div ref="rootRef" class="relative shrink-0">
        <button
            :id="id"
            type="button"
            class="inline-flex items-center gap-2 rounded-xl px-0 py-0 font-sans text-[15px] font-semibold leading-none text-black transition duration-200 hover:-translate-y-0.5 focus:outline-none focus:ring-2 focus:ring-black/10"
            :aria-expanded="isOpen.toString()"
            @click="toggleMenu"
        >
            <span>{{ displayLabel }}</span>
            <img
                :src="arrowIconSrc"
                class="h-[10px] w-[10px] shrink-0 rotate-90 object-contain"
                alt=""
            />
        </button>

        <div
            v-if="isOpen"
            :id="`${id}-menu`"
            class="absolute left-0 top-full z-30 mt-2 max-h-64 min-w-full overflow-y-auto rounded-2xl bg-white py-2 shadow-md"
            role="listbox"
        >
            <button
                v-for="option in options"
                :key="`${id}-${option.value || 'empty'}`"
                type="button"
                class="block w-full whitespace-nowrap px-4 py-2 text-left font-sans text-[15px] font-semibold leading-none text-black transition duration-150 hover:bg-black/5 focus:bg-black/5 focus:outline-none"
                role="option"
                @click="selectOption(option.value)"
            >
                {{ option.label }}
            </button>
        </div>
    </div>
</template>
