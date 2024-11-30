<script setup lang="ts">
import { ref, watch } from 'vue';

const props = withDefaults(defineProps<{
  file: File | null;
}>(), {
  file: null
});

const imageUrl = ref<string>('');

watch(() => props.file, (newFile: File | null) => {
  if (imageUrl.value) {
    URL.revokeObjectURL(imageUrl.value);
  }
  
  if (newFile) {
    imageUrl.value = URL.createObjectURL(newFile);
  } else {
    imageUrl.value = '';
  }
});
</script>

<template>
  <div v-if="imageUrl" class="image-preview mt-3">
    <img :src="imageUrl" alt="Preview" class="img-fluid rounded" style="max-height: 300px" />
  </div>
</template>