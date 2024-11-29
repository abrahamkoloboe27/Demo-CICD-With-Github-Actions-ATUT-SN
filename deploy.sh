#!/bin/bash

# Étape 0 : Variables
GITHUB_USERNAME="abrahamkoloboe27"
DEPLOYMENT_DIR="deployment"

# Étape 1 : Exécuter install_docker.sh pour vérifier et installer Docker si nécessaire
echo "Vérification et installation de Docker si nécessaire..."
chmod +x install_docker.sh
./install_docker.sh

# Étape 2 : Authentification au GitHub Container Registry (GHCR)
echo "Authentification au GitHub Container Registry..."
echo $GHCR_PAT | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

# Étape 3 : Créer le dossier 'deployment' et le fichier docker-compose.yml
echo "Création du dossier '$DEPLOYMENT_DIR' et du fichier 'docker-compose.yml'..."
mkdir -p "$DEPLOYMENT_DIR"

cat > $DEPLOYMENT_DIR/docker-compose.yml << EOF
services:
  frontend:
    image: ghcr.io/abrahamkoloboe27/demo-cicd-atut-frontend:latest
    container_name: frontend
    ports:
      - "80:80"
    networks:
      - demo-cicd-atut-network
    volumes:
      - frontend:/usr/share/nginx/html
  backend:
    image: ghcr.io/abrahamkoloboe27/demo-cicd-atut-backend:latest
    container_name: backend
    ports:
      - "5000:5000"
    networks:
      - demo-cicd-atut-network
    volumes:
      - backend:/app

networks:
  demo-cicd-atut-network:
    driver: bridge

volumes:
  frontend:
  backend:
EOF

# Étape 4 : Déployer les conteneurs avec Docker Compose
echo "Déploiement des conteneurs avec Docker Compose..."
cd "$DEPLOYMENT_DIR"

# Vérifier si les services sont déjà en cours d'exécution
services_running=$(docker-compose ps -q)

if [ -z "$services_running" ]; then
  echo "Les services ne tournent pas encore. Lancement avec 'docker-compose up -d'..."
  docker-compose up -d
else
  echo "Les services tournent déjà. Mise à jour avec les nouvelles images..."
  docker-compose pull
  docker-compose up -d
fi

echo "Déploiement terminé."
