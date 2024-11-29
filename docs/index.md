# 🍎🚀 Guide de Déploiement Automatisé d'une Application de Classification de Fruits 🍌🎯

## 📚 Table des matières

- [🍎🚀 Guide de Déploiement Automatisé d'une Application de Classification de Fruits 🍌🎯](#-guide-de-déploiement-automatisé-dune-application-de-classification-de-fruits-)
  - [📚 Table des matières](#-table-des-matières)
  - [Introduction](#introduction)
  - [📖 Description du Projet](#-description-du-projet)
  - [🔧 Prérequis](#-prérequis)
  - [🛠️ Étapes du Projet](#️-étapes-du-projet)
    - [1. 🎓 Entraînement du Modèle de Classification](#1--entraînement-du-modèle-de-classification)
    - [2. 📝 Construction de l'API Backend avec FastAPI](#2--construction-de-lapi-backend-avec-fastapi)
    - [3. 💻 Développement de l'Interface Frontend avec Vue.js](#3--développement-de-linterface-frontend-avec-vuejs)
    - [4. 🐳 Conteneurisation avec Docker](#4--conteneurisation-avec-docker)
    - [5. 🤖 Automatisation CI/CD avec GitHub Actions](#5--automatisation-cicd-avec-github-actions)
    - [6. 🚀 Déploiement Automatisé sur le Serveur](#6--déploiement-automatisé-sur-le-serveur)
  - [🔍 Détails du Déploiement](#-détails-du-déploiement)
    - [1. 🔎 Vérification et Installation de Docker](#1--vérification-et-installation-de-docker)
    - [2. 🔐 Authentification au Registre de Conteneurs GitHub](#2--authentification-au-registre-de-conteneurs-github)
    - [3. 📥 Pull des Images Docker](#3--pull-des-images-docker)
    - [4. 📄 Création du Fichier `docker-compose.yml`](#4--création-du-fichier-docker-composeyml)
    - [5. 🎛️ Lancement ou Mise à Jour des Services avec Docker Compose](#5-️-lancement-ou-mise-à-jour-des-services-avec-docker-compose)
  - [🏃‍♂️ Exécution Locale du Projet](#️-exécution-locale-du-projet)
    - [1. ⚙️ Construction des Images Docker Localement](#1-️-construction-des-images-docker-localement)
    - [2. 🚀 Lancement des Conteneurs Docker](#2--lancement-des-conteneurs-docker)
    - [3. 🌐 Accès à l'Application dans le Navigateur](#3--accès-à-lapplication-dans-le-navigateur)
  - [🎉 Conclusion](#-conclusion)
  - [📎 Annexes](#-annexes)
    - [Exemples de Commandes Utiles](#exemples-de-commandes-utiles)
    - [Ressources Supplémentaires](#ressources-supplémentaires)



## Introduction

Bienvenue dans ce guide complet de déploiement automatisé d'une application de classification de fruits 🍏🍊. Ce document vous guidera à travers toutes les étapes, du développement initial à l'exécution locale et au déploiement automatisé sur un serveur distant 🌐.



## 📖 Description du Projet

Le projet consiste à développer une application capable de classer des fruits à l'aide d'un modèle d'apprentissage automatique 🤖. Il est structuré de la manière suivante :

- **Backend** (`Backend/`) : Une API développée avec **FastAPI** en Python 🐍, intégrant le modèle de classification entraîné.
- **Frontend** (`Frontend/`) : Une application web développée avec **Vue.js** 🖥️, offrant une interface utilisateur interactive.
- **CI/CD** : Un pipeline automatisé utilisant **GitHub Actions** 🛠️ pour construire et déployer les images Docker à chaque modification du code.
- **Déploiement** : Un processus automatisé pour déployer les conteneurs sur un serveur distant, en s'assurant que les dépendances (Docker) sont présentes et à jour.



## 🔧 Prérequis

- **Docker** installé sur votre machine locale 🐳.
- **Git** pour cloner le dépôt 📁.
- Compte **GitHub** avec accès au **GitHub Container Registry (GHCR)** 🔐.
- Serveur distant avec accès SSH pour le déploiement 🖥️.
- Clé SSH pour l'authentification sans mot de passe 🔑.
- Connaissances de base en Docker, Docker Compose et GitHub Actions 📝.



## 🛠️ Étapes du Projet

### 1. 🎓 Entraînement du Modèle de Classification

- **Collecte des données** : Obtenir un jeu de données d'images de fruits étiquetées 🍓🍍.
- **Prétraitement** : Nettoyer et préparer les données pour l'entraînement 🧹.
- **Entraînement du modèle** : Utiliser un framework de machine learning (par exemple, TensorFlow, PyTorch) pour entraîner le modèle de classification 🧠.
- **Sauvegarde du modèle** : Enregistrer le modèle entraîné dans un format approprié pour une utilisation ultérieure 💾.

### 2. 📝 Construction de l'API Backend avec FastAPI

- **Création de l'application FastAPI** : Initialiser une application FastAPI en Python 🐍.
- **Intégration du modèle** : Charger le modèle de classification entraîné dans l'application 🎛️.
- **Définition des endpoints** : Créer des routes pour permettre aux clients de soumettre des images et de recevoir des prédictions 🔄.
- **Tests locaux** : Vérifier que l'API fonctionne correctement en local 🧪.

### 3. 💻 Développement de l'Interface Frontend avec Vue.js

- **Initialisation du projet Vue.js** : Créer une nouvelle application Vue.js pour le frontend 🖥️.
- **Conception de l'interface utilisateur** : Développer une interface permettant aux utilisateurs de télécharger des images de fruits et de visualiser les résultats de la classification 🎨.
- **Intégration avec l'API** : Configurer les appels API pour interagir avec le backend FastAPI 🔗.
- **Tests locaux** : S'assurer que l'interface fonctionne correctement en local 🛠️.

### 4. 🐳 Conteneurisation avec Docker

- **Création des Dockerfiles** :
  - **Backend** (`Backend/Dockerfile`) : Rédiger un `Dockerfile` pour l'application FastAPI, incluant toutes les dépendances nécessaires 📄.
  - **Frontend** (`Frontend/Dockerfile`) : Rédiger un `Dockerfile` pour l'application Vue.js 📄.
- **Construction des images Docker** :
  - **Backend** :
    ```bash
    cd Backend
    docker build -t demo-cicd-atut-backend .
    ```
  - **Frontend** :
    ```bash
    cd Frontend
    docker build -t demo-cicd-atut-frontend .
    ```
- **Tests locaux des conteneurs** :
  - **Backend** :
    ```bash
    docker run -d -p 8080:8080 demo-cicd-atut-backend
    ```
  - **Frontend** :
    ```bash
    docker run -d -p 80:80 demo-cicd-atut-frontend
    ```
  - Accédez à l'API via `http://localhost:8080` et au frontend via `http://localhost` 🌐.

### 5. 🤖 Automatisation CI/CD avec GitHub Actions

- **Création du dépôt GitHub** : Héberger le code source sur GitHub 📂.
- **Configuration du GitHub Container Registry (GHCR)** : Configurer GHCR pour stocker les images Docker 🗄️.
- **Mise en place de GitHub Actions** :
  - **Workflow de build** : Créer un fichier de workflow (`.github/workflows/deploy.yml`) pour automatiser la construction et le push des images Docker à chaque modification du code ⚙️.
  - **Déclencheurs** : Configurer le workflow pour s'exécuter lors des push sur la branche principale 🚦.
- **Secrets GitHub** : Ajouter les secrets nécessaires (`GHCR_PAT`, `SSH_PRIVATE_KEY`, `SERVER_HOST`, `SERVER_USER`, `SERVER_PORT`) dans les paramètres du dépôt 🔐.

### 6. 🚀 Déploiement Automatisé sur le Serveur

- **Script de déploiement (`deploy.sh`)** :
  - Vérifie si Docker est installé, et l'installe si nécessaire via `install_docker.sh` 🛠️.
  - Authentifie le serveur auprès de GHCR en utilisant le token `GHCR_PAT` 🔑.
  - Crée le fichier `docker-compose.yml` pour orchestrer les conteneurs 📄.
  - Lance ou met à jour les services Docker Compose selon qu'ils sont déjà en cours d'exécution ou non 🚀.



## 🔍 Détails du Déploiement

### 1. 🔎 Vérification et Installation de Docker

- **Script `install_docker.sh`** :
  - Vérifie si Docker est installé 🐳.
  - Si non, il installe Docker en suivant les instructions officielles 🛠️.
  - Installe également Docker Compose 📦.

### 2. 🔐 Authentification au Registre de Conteneurs GitHub

- **Token d'authentification (`GHCR_PAT`)** :
  - Doit avoir le scope `read:packages` pour permettre le pull des images 🔑.
  - Est passé au serveur via les variables d'environnement lors de la connexion SSH 🌐.
- **Commande d'authentification** :
  ```bash
  echo $GHCR_PAT | docker login ghcr.io -u <GITHUB_USERNAME> --password-stdin
  ```

### 3. 📥 Pull des Images Docker

- **Commandes pour pull les images** :
  ```bash
  docker pull ghcr.io/<GITHUB_USERNAME>/demo-cicd-atut-frontend:latest
  docker pull ghcr.io/<GITHUB_USERNAME>/demo-cicd-atut-backend:latest
  ```
- **Assurez-vous que les images sont accessibles** :
  - Les images doivent être publiques ou le token doit avoir les permissions nécessaires 🔐.

### 4. 📄 Création du Fichier `docker-compose.yml`

- **Contenu du fichier** :

  ```yaml
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
        - "8080:8080"
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
  ```

- **Remarque** : La version n'est pas spécifiée car elle est optionnelle et peut être omise 🔄.

- **Génération via le script `deploy.sh`** :
  - Le script crée le fichier `docker-compose.yml` dans le répertoire de déploiement 📁.

### 5. 🎛️ Lancement ou Mise à Jour des Services avec Docker Compose

- **Vérification de l'état des services** :
  - Le script vérifie si les services sont déjà en cours d'exécution avec `docker-compose ps -q` 🔍.
- **Lancement initial** :
  - Si les services ne tournent pas, le script exécute `docker-compose up -d` pour les démarrer 🚀.
- **Mise à jour des services** :
  - Si les services tournent déjà, le script exécute `docker-compose pull` pour récupérer les nouvelles images, puis `docker-compose up -d` pour appliquer les changements 🔄.



## 🏃‍♂️ Exécution Locale du Projet

### 1. ⚙️ Construction des Images Docker Localement

- **Cloner le dépôt GitHub** :
  ```bash
  git clone https://github.com/<GITHUB_USERNAME>/<REPOSITORY_NAME>.git
  cd <REPOSITORY_NAME>
  ```

- **Backend** :
  ```bash
  cd Backend
  docker build -t demo-cicd-atut-backend .
  ```

- **Frontend** :
  ```bash
  cd ../Frontend
  docker build -t demo-cicd-atut-frontend .
  ```

### 2. 🚀 Lancement des Conteneurs Docker

- **Backend** :
  ```bash
  docker run -d -p 8080:8080 demo-cicd-atut-backend
  ```
  - L'API est maintenant accessible sur `http://localhost:8080` 🌐.

- **Frontend** :
  ```bash
  docker run -d -p 80:80 demo-cicd-atut-frontend
  ```
  - Le frontend est accessible sur `http://localhost` 🌐.

### 3. 🌐 Accès à l'Application dans le Navigateur

- **Accéder au frontend** :
  - Ouvrez votre navigateur et rendez-vous sur `http://localhost` 🖥️.
- **Interaction avec l'API** :
  - Le frontend communique avec l'API backend qui tourne sur le port `8080` 🔄.
- **Tester l'application** :
  - Téléchargez une image de fruit et visualisez la prédiction 🍌➡️🤖.



## 🎉 Conclusion

Vous avez maintenant une application de classification de fruits entièrement fonctionnelle 🍇🍉, que vous pouvez exécuter localement ou déployer sur un serveur distant 🚀. Ce guide vous a accompagné à travers toutes les étapes, de la construction du modèle à l'automatisation du déploiement avec CI/CD 🤖.



## 📎 Annexes

### Exemples de Commandes Utiles

- **Génération d'une paire de clés SSH** 🔑 :
  ```bash
  ssh-keygen -t rsa -b 4096 -C "github-actions" -f github_actions_key
  ```
- **Ajout de la clé publique au serveur** :
  ```bash
  cat github_actions_key.pub >> ~/.ssh/authorized_keys
  ```
- **Définition manuelle de la variable `GHCR_PAT` sur le serveur** :
  ```bash
  export GHCR_PAT=your_personal_access_token
  ```
- **Test de l'authentification au GHCR sur le serveur** :
  ```bash
  echo $GHCR_PAT | docker login ghcr.io -u <GITHUB_USERNAME> --password-stdin
  ```

### Ressources Supplémentaires

- [Documentation de Docker](https://docs.docker.com/) 🐳
- [Documentation de Docker Compose](https://docs.docker.com/compose/) 📦
- [Documentation de GitHub Actions](https://docs.github.com/actions) 🤖
- [Documentation de FastAPI](https://fastapi.tiangolo.com/) 🐍
- [Documentation de Vue.js](https://vuejs.org/) 🖥️



**Note** : Assurez-vous de remplacer `<GITHUB_USERNAME>` par votre nom d'utilisateur GitHub réel dans les commandes et configurations, et `<REPOSITORY_NAME>` par le nom de votre dépôt 📛.



🎊 Merci d'avoir suivi ce guide ! N'hésitez pas à contribuer au projet ou à poser des questions si vous rencontrez des difficultés. Bonne continuation dans vos projets de développement ! 🚀