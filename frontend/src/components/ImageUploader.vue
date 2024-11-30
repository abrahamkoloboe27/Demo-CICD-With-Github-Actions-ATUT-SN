<script setup lang="ts">
const emit = defineEmits<{
  (e: 'fileSelected', file: File): void
}>();

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
      @change="handleFileChange"
      accept="image/jpeg,image/png,image/jpg"
      class="form-control"
    />
  </div>
</template>