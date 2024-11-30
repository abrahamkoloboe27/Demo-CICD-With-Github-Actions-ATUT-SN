import { ref } from 'vue';
import { predictImage } from '../services/api';

export function usePrediction() {
  const predictedClass = ref<string>('');
  const confidence = ref<number>(0);
  const isLoading = ref<boolean>(false);
  const error = ref<string>('');

  const predict = async (file: File) => {
    if (!file) {
      error.value = 'Please select an image first.';
      return;
    }

    try {
      isLoading.value = true;
      error.value = '';
      const result = await predictImage(file);
      predictedClass.value = result.predicted_class;
      confidence.value = result.confidence;
    } catch (e) {
      error.value = 'An error occurred during prediction. Please try again.';
      console.error('Prediction error:', e);
    } finally {
      isLoading.value = false;
    }
  };

  const resetPrediction = () => {
    predictedClass.value = '';
    confidence.value = 0;
    error.value = '';
  };

  return {
    predictedClass,
    confidence,
    isLoading,
    error,
    predict,
    resetPrediction
  };
}