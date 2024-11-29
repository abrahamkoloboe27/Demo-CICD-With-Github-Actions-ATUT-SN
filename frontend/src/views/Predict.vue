<script setup lang="ts">
import { ref } from 'vue';
import ImageUploader from '../components/ImageUploader.vue';
import ImagePreview from '../components/ImagePreview.vue';
import PredictionResult from '../components/PredictionResult.vue';
import LoadingSpinner from '../components/LoadingSpinner.vue';
import { predictImage } from '../services/api';

const selectedFile = ref<File | null>(null);
const predictedClass = ref<string>('');
const confidence = ref<number>(0);
const error = ref<string>('');
const isLoading = ref<boolean>(false);

const handleFileSelected = (file: File) => {
  selectedFile.value = file;
  error.value = '';
  predictedClass.value = '';
  confidence.value = 0;
};

const handlePredict = async () => {
  if (!selectedFile.value) {
    error.value = 'Veuillez sélectionner une image.';
    return;
  }

  try {
    isLoading.value = true;
    error.value = '';
    const result = await predictImage(selectedFile.value);
    predictedClass.value = result.predicted_class;
    confidence.value = result.confidence;
  } catch (e) {
    error.value = 'Une erreur est survenue lors de la prédiction. Veuillez réessayer.';
    console.error('Prediction error:', e);
  } finally {
    isLoading.value = false;
  }
};
</script>

<template>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card shadow-sm">
          <div class="card-body">
            <h2 class="card-title text-center mb-4">Classifier une Image de Fruit 🍎</h2>
            
            <ImageUploader @file-selected="handleFileSelected" />
            <ImagePreview :file="selectedFile" />
            
            <div class="mt-3 text-center">
              <button 
                class="btn btn-primary"
                @click="handlePredict"
                :disabled="!selectedFile || isLoading"
              >
                <LoadingSpinner v-if="isLoading" size="sm" />
                {{ isLoading ? 'Prédiction en cours...' : 'Prédire' }}
              </button>
            </div>

            <div v-if="error" class="alert alert-danger mt-3">
              {{ error }}
            </div>

            <PredictionResult
              v-if="predictedClass && confidence"
              :predicted-class="predictedClass"
              :confidence="confidence"
            />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>