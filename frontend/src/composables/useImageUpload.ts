import { ref } from 'vue';
import { createImagePreview, revokeImagePreview, validateImageFile } from '../utils/imageHelpers';

export function useImageUpload() {
  const selectedFile = ref<File | null>(null);
  const imageUrl = ref<string>('');
  const error = ref<string>('');

  const handleFileChange = (file: File) => {
    if (!validateImageFile(file)) {
      error.value = 'Please select a valid image file (JPG, PNG)';
      return;
    }

    if (imageUrl.value) {
      revokeImagePreview(imageUrl.value);
    }

    selectedFile.value = file;
    imageUrl.value = createImagePreview(file);
    error.value = '';
  };

  const resetUpload = () => {
    if (imageUrl.value) {
      revokeImagePreview(imageUrl.value);
    }
    selectedFile.value = null;
    imageUrl.value = '';
    error.value = '';
  };

  return {
    selectedFile,
    imageUrl,
    error,
    handleFileChange,
    resetUpload
  };
}