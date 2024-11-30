import axios from 'axios';

const API_URL = 'http://localhost:8080/predict';

export interface PredictionResponse {
  predicted_class: string;
  confidence: number;
}

// Create axios instance with default config
const apiClient = axios.create({
  baseURL: API_URL,
  headers: {
    'Content-Type': 'multipart/form-data',
    'Accept': 'application/json',
  },
  // Enable credentials if needed
  // withCredentials: true,
});

// Add request interceptor for handling errors
apiClient.interceptors.request.use(
  (config) => {
    // You can add any request preprocessing here
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

// Add response interceptor for handling errors
apiClient.interceptors.response.use(
  (response) => {
    return response;
  },
  (error) => {
    if (error.response) {
      // Handle specific error cases
      switch (error.response.status) {
        case 403:
          console.error('Access forbidden:', error.response.data);
          break;
        case 429:
          console.error('Too many requests:', error.response.data);
          break;
        default:
          console.error('API error:', error.response.data);
      }
    } else if (error.request) {
      console.error('No response received:', error.request);
    } else {
      console.error('Error setting up request:', error.message);
    }
    return Promise.reject(error);
  }
);

export const predictImage = async (file: File): Promise<PredictionResponse> => {
  try {
    const formData = new FormData();
    formData.append('file', file);

    const response = await apiClient.post<PredictionResponse>('', formData);
    return response.data;
  } catch (error) {
    console.error('Error predicting image:', error);
    throw error;
  }
};