<script setup lang="ts">
defineProps<{
  predictedClass: string;
  confidence: number;
}>();
</script>

<template>
  <div class="prediction-result mt-4">
    <h3>Résultats de la Prédiction</h3>
    <div class="card">
      <div class="card-body">
        <p class="mb-2">
          <strong>Fruit Détecté:</strong> 
          <span class="ms-2">{{ predictedClass }}</span>
        </p>
        <p class="mb-0">
          <strong>Confiance:</strong>
          <span class="ms-2">{{ confidence.toFixed(2) }}%</span>
        </p>
      </div>
    </div>
  </div>
</template>