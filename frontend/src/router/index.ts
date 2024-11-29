import { createRouter, createWebHistory } from 'vue-router';
import Home from '../views/Home.vue';
import Predict from '../views/Predict.vue';

const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home
    },
    {
      path: '/predict',
      name: 'predict',
      component: Predict
    }
  ]
});

export default router;