import axios from 'axios';

const API_URL = 'https://abrahamklb-fruits-recognition-api.hf.space/predict';

export interface PredictionResponse {
  predicted_class: string;
  confidence: number;
}

export const predictImage = async (file: File): Promise<PredictionResponse> => {
  const formData = new FormData();
  formData.append('file', file);

  const response = await axios.post<PredictionResponse>(API_URL, formData, {
    headers: {
      'Content-Type': 'multipart/form-data',
    },
  });

  return response.data;
};