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
        gnupg

    # Ajouter la clé GPG officielle de Docker
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg

    # Ajouter le dépôt Docker aux sources APT
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Mettre à jour l'index des paquets avec le nouveau dépôt
    sudo apt-get update

    # Installer Docker Engine, CLI, containerd, et plugins
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    # Ajouter l'utilisateur actuel au groupe docker pour éviter d'utiliser 'sudo' avec les commandes Docker
    sudo usermod -aG docker $USER

    echo "Docker a été installé avec succès."
    echo "Veuillez vous déconnecter puis vous reconnecter pour que les modifications prennent effet."
fi
