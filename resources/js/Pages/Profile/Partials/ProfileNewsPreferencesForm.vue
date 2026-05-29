<script setup>
import CCheckbox from "../../../Components/UI/CCheckbox.vue";

defineProps(["newsPreferencesForm"]);

defineEmits(["update-preference"]);
</script>

<template>
    <div class="space-y-4">
        <CCheckbox
            id="profile-news-wants-newsletter"
            :model-value="newsPreferencesForm.wants_newsletter"
            label="noriu gauti Mind Gym naujienlaiškius el. paštu"
            wrapper-class="pt-1"
            :disabled="newsPreferencesForm.processing"
            @update:model-value="
                $emit('update-preference', 'wants_newsletter', $event)
            "
        />

        <CCheckbox
            id="profile-news-wants-event-notifications"
            :model-value="newsPreferencesForm.wants_event_notifications"
            label="noriu gauti pranešimus apie naujus renginius"
            wrapper-class="pt-1"
            :disabled="newsPreferencesForm.processing"
            @update:model-value="
                $emit(
                    'update-preference',
                    'wants_event_notifications',
                    $event,
                )
            "
        />

        <CCheckbox
            id="profile-news-wants-game-notifications"
            :model-value="newsPreferencesForm.wants_game_notifications"
            label="noriu gauti pranešimus apie naujus stalo žaidimus"
            wrapper-class="pt-1"
            :disabled="newsPreferencesForm.processing"
            @update:model-value="
                $emit('update-preference', 'wants_game_notifications', $event)
            "
        />

        <CCheckbox
            id="profile-news-wants-learning-notifications"
            :model-value="newsPreferencesForm.wants_learning_notifications"
            label="noriu gauti pranešimus apie mokymosi turinį"
            wrapper-class="pt-1"
            :disabled="newsPreferencesForm.processing"
            @update:model-value="
                $emit(
                    'update-preference',
                    'wants_learning_notifications',
                    $event,
                )
            "
        />

        <CCheckbox
            id="profile-news-wants-event-reminders"
            :model-value="newsPreferencesForm.wants_event_reminders"
            label="noriu gauti priminimus apie mano dalyvaujamuose artėjančius renginius"
            wrapper-class="pt-1"
            :disabled="newsPreferencesForm.processing"
            @update:model-value="
                $emit('update-preference', 'wants_event_reminders', $event)
            "
        />
    </div>
</template>
