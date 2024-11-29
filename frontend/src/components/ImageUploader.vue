<script setup lang="ts">
import { ref } from 'vue';

const emit = defineEmits<{
  (e: 'fileSelected', file: File): void
}>();

const fileInput = ref<HTMLInputElement | null>(null);

const handleFileChange = (event: Event) => {
  const input = event.target as HTMLInputElement;
  if (input.files && input.files[0]) {
    emit('fileSelected', input.files[0]);
  }
};
</script>

<template>
  <div class="image-uploader">
    <input
      type="file"
      ref="fileInput"
      @change="handleFileChange"
      accept="image/jpeg,image/png,image/jpg"
      class="form-control"
    />
  </div>
</template>