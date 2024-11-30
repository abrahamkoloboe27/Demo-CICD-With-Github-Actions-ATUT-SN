<script setup lang="ts">
import ImageUploader from '../components/ImageUploader.vue';
import ImagePreview from '../components/ImagePreview.vue';
import PredictionResult from '../components/PredictionResult.vue';
import LoadingSpinner from '../components/LoadingSpinner.vue';
import { useImageUpload } from '../composables/useImageUpload';
import { usePrediction } from '../composables/usePrediction';

const { 
  selectedFile, 
  imageUrl, 
  error: uploadError, 
  handleFileChange 
} = useImageUpload();

const {
  predictedClass,
  confidence,
  isLoading,
  error: predictionError,
  predict
} = usePrediction();

const handlePredict = async () => {
  if (selectedFile.value) {
    await predict(selectedFile.value);
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
            
            <ImageUploader @file-selected="handleFileChange" />
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

            <div v-if="uploadError || predictionError" class="alert alert-danger mt-3">
              {{ uploadError || predictionError }}
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