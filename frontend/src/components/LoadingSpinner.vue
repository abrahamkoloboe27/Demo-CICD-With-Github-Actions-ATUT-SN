<script setup lang="ts">
defineProps<{
  size?: 'sm' | 'md' | 'lg';
}>();
</script>

<template>
  <div class="spinner-wrapper">
    <div 
      class="spinner-border" 
      :class="[size ? `spinner-border-${size}` : '']" 
      role="status"
    >
      <span class="visually-hidden">Chargement...</span>
    </div>
  </div>
</template>

<style scoped>
.spinner-wrapper {
  display: inline-block;
  margin-right: 0.5rem;
}
</style>