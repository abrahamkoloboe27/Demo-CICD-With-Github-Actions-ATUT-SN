#!/bin/bash

# Vérifier si Docker est installé
if command -v docker >/dev/null 2>&1; then
    echo "Docker est déjà installé."
else
    echo "Docker n'est pas installé. Installation en cours..."

    # Mettre à jour l'index des paquets
    sudo apt-get update

    # Installer les paquets nécessaires pour utiliser le dépôt via HTTPS
    sudo apt-get install -y \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

    # Ajouter la clé GPG officielle de Docker
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    # Ajouter le dépôt Docker aux sources APT
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Mettre à jour l'index des paquets avec le nouveau dépôt
    sudo apt-get update

    # Installer Docker Engine, CLI, containerd
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io

    # Ajouter l'utilisateur actuel au groupe docker pour éviter d'utiliser 'sudo' avec les commandes Docker
    sudo usermod -aG docker $USER

    echo "Docker a été installé avec succès."
fi

# Vérifier si Docker Compose est installé
if command -v docker-compose >/dev/null 2>&1; then
    echo "Docker Compose est déjà installé."
else
    echo "Docker Compose n'est pas installé. Installation en cours..."

    # Télécharger la dernière version de Docker Compose
    DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

    sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" \
    -o /usr/local/bin/docker-compose

    # Appliquer les permissions d'exécution
    sudo chmod +x /usr/local/bin/docker-compose

    # Vérifier si le lien symbolique existe déjà
    if [ ! -L /usr/bin/docker-compose ]; then
        sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    fi

    echo "Docker Compose a été installé avec succès."
fi

echo "Installation terminée. Veuillez vous déconnecter puis vous reconnecter pour que les modifications prennent effet."
