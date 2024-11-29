<script setup lang="ts">
import { ref } from 'vue';
// Suppression de l'import inutilisé de useRouter

const isNavCollapsed = ref(true);

const toggleNav = () => {
  isNavCollapsed.value = !isNavCollapsed.value;
};
</script>

<template>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
      <router-link class="navbar-brand" to="/">🍎 Fruit Classifier</router-link>
      
      <button 
        class="navbar-toggler" 
        type="button" 
        @click="toggleNav"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>

      <div 
        class="collapse navbar-collapse" 
        :class="{ 'show': !isNavCollapsed }"
      >
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <router-link class="nav-link" to="/">Accueil</router-link>
          </li>
          <li class="nav-item">
            <router-link class="nav-link" to="/predict">Classifier</router-link>
          </li>
        </ul>
        
        <div class="d-flex">
          <a 
            href="https://github.com/abrahamklb" 
            target="_blank" 
            rel="noopener noreferrer" 
            class="btn btn-outline-dark me-2"
          >
            <i class="fab fa-github"></i>
          </a>
          <a 
            href="https://www.linkedin.com/in/abraham-koloboe" 
            target="_blank" 
            rel="noopener noreferrer" 
            class="btn btn-outline-primary"
          >
            <i class="fab fa-linkedin"></i>
          </a>
        </div>
      </div>
    </div>
  </nav>
</template>

<style scoped>
.navbar {
  box-shadow: 0 2px 4px rgba(0,0,0,.1);
}

.nav-link.router-link-active {
  font-weight: bold;
  color: #0d6efd !important;
}
</style>
