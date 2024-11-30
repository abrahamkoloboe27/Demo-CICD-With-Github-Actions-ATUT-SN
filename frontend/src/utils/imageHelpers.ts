import { ref } from 'vue';

export const createImagePreview = (file: File): string => {
  return URL.createObjectURL(file);
};

export const revokeImagePreview = (url: string): void => {
  URL.revokeObjectURL(url);
};

export const validateImageFile = (file: File): boolean => {
  const validTypes = ['image/jpeg', 'image/png', 'image/jpg'];
  return validTypes.includes(file.type);
};