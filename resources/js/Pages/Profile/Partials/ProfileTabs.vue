<script setup>
defineProps(["tabs", "activeTab"]);

defineEmits(["update:activeTab"]);
</script>

<template>
    <div class="overflow-x-auto pl-1 pt-1">
        <div class="-ml-1 flex min-w-max items-end gap-2 pr-1">
            <button
                v-for="tab in tabs"
                :key="tab.key"
                type="button"
                class="inline-flex min-h-[3.6rem] shrink-0 items-center gap-3 whitespace-nowrap rounded-t-3xl px-4 py-3 text-left font-sans text-sm font-black leading-none text-black shadow-md transition duration-200 sm:px-5 sm:text-[0.95rem]"
                :class="activeTab === tab.key ? 'bg-mg-blue' : 'bg-[#D5E5F1]'"
                @click="$emit('update:activeTab', tab.key)"
            >
                <img
                    :src="tab.icon"
                    alt=""
                    class="h-5 w-5 shrink-0 object-contain"
                />
                <span>{{ tab.label }}</span>
            </button>
        </div>
    </div>
</template>
