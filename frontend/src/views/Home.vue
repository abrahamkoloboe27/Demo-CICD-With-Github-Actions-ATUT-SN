<script setup lang="ts">
import { useRouter } from 'vue-router';

const router = useRouter();

const navigateToPredict = () => {
  router.push('/predict');
};
</script>

<template>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-8 text-center">
        <h1 class="display-4 mb-4">Classification d'Images de Fruits 🍇🍉🍍</h1>
        
        <div class="mt-4">
          <p class="lead">
            Cette application utilise un modèle de deep learning pour classifier des images de fruits.
            Vous pouvez télécharger une image de fruit, et l'application affichera la classe prédite
            ainsi que le score de confiance.
          </p>

          <div class="features mt-5">
            <h3>Fonctionnalités :</h3>
            <ul class="list-unstyled">
              <li class="mb-3">📷 <strong>Téléchargement d'Image</strong> : Chargez une image de fruit au format JPG, PNG ou JPEG.</li>
              <li class="mb-3">🧠 <strong>Prédiction</strong> : Le modèle de deep learning prédit la classe du fruit.</li>
              <li class="mb-3">📊 <strong>Visualisation</strong> : Affichez les résultats de la prédiction et les scores de confiance.</li>
            </ul>
          </div>

          <div class="mt-5">
            <h3>Comment Utiliser l'Application :</h3>
            <ol class="list-unstyled">
              <li class="mb-3">1. Cliquez sur le bouton <strong>"Commencer"</strong> ci-dessous.</li>
              <li class="mb-3">2. Téléchargez une image de fruit depuis votre appareil.</li>
              <li class="mb-3">3. Visualisez les résultats de la prédiction affichés à l'écran.</li>
            </ol>
          </div>

          <button @click="navigateToPredict" class="btn btn-primary btn-lg mt-4">
            Commencer
          </button>
        </div>
      </div>
    </div>
  </div>
</template>