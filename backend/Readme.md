# Fruits Recognition API 🍎🍌

API pour la reconnaissance de fruits basée sur un modèle de Machine Learning, développée avec **FastAPI**.

## Table des Matières

- [Introduction](#introduction)
- [Fonctionnalités](#fonctionnalités)
- [Installation](#installation)
- [Utilisation](#utilisation)
  - [Lancer l'API](#lancer-lapi)
  - [Tester l'API](#tester-lapi)
- [Endpoints](#endpoints)
  - [`POST /predict`](#post-predict)
- [Modèle ML](#modèle-ml)
- [Documentation](#documentation)
- [Déploiement](#déploiement)
- [Contribuer](#contribuer)
- [Licence](#licence)
- [Auteur](#auteur)



## Introduction

Cette API permet de prédire le type de fruit présent dans une image donnée. Elle utilise un modèle de Deep Learning entraîné sur le dataset Fruits-360.

## Fonctionnalités

- **Prédiction de fruits** : Envoie une image et reçoit la prédiction du fruit.
- **API rapide et scalable** : Grâce à FastAPI et Uvicorn.
- **Documentation interactive** : Accédez à `/docs` pour tester l'API directement depuis votre navigateur.

## Installation

### Prérequis

- Python 3.7+
- Pip

### Étapes d'installation

1. **Cloner le dépôt**

   ```bash
   git clone https://github.com/abrahamkoloboe27/Fruits-Recognition-API.git
   cd Fruits-Recognition-API
   ```

2. **Créer un environnement virtuel**

   ```bash
   python -m venv env
   source env/bin/activate  # Sur Windows, utilisez `env\Scripts\activate`
   ```

3. **Installer les dépendances**

   ```bash
   pip install -r requirements.txt
   ```

## Utilisation

### Lancer l'API

Assurez-vous d'être dans l'environnement virtuel et à la racine du projet.

```bash
uvicorn app:app --reload
```

- L'API sera accessible sur `http://127.0.0.1:8080`

### Tester l'API

Accédez à la documentation interactive pour tester l'API directement depuis votre navigateur :

- [http://127.0.0.1:8080/docs](http://127.0.0.1:8080/docs)

## Endpoints

### `POST /predict`

- **Description** : Prédit le fruit présent dans l'image envoyée.
- **Paramètres** :
  - `file` (formData) : Image du fruit à analyser (JPEG ou PNG).
- **Réponse** :
  - `prediction` : Nom du fruit prédit.
  - `confidence` : Confiance de la prédiction en pourcentage.

#### Exemple de requête avec `curl`

```bash
curl -X POST "http://127.0.0.1:8080/predict" -F "file=@path_to_your_image.jpg"
```

## Modèle ML

- Le modèle utilisé est un CNN entraîné sur le dataset [Fruits-360](https://www.kaggle.com/moltean/fruits).
- Modèle sauvegardé au format `.h5` et chargé lors du démarrage de l'API.

## Documentation

FastAPI génère automatiquement une documentation interactive accessible via :

- **Swagger UI** : [http://127.0.0.1:8080/docs](http://127.0.0.1:8080/docs)

![Swagger UI](video/doc.gif)

- **Redoc** : [http://127.0.0.1:8080/redoc](http://127.0.0.1:8080/redoc)

![Redoc](video/redoc.gif)

## Déploiement

L'API est déployée en ligne et accessible à l'adresse suivante :

- [https://abrahamklb-fruits-recognition-api.hf.space/docs](https://abrahamklb-fruits-recognition-api.hf.space/docs)

## Contribuer

Les contributions sont les bienvenues ! Veuillez suivre les étapes suivantes :

1. **Fork** le projet.
2. Créez une **branche** pour votre fonctionnalité (`git checkout -b feature/AmazingFeature`).
3. **Commitez** vos changements (`git commit -m 'Add some AmazingFeature'`).
4. **Pushez** vers la branche (`git push origin feature/AmazingFeature`).
5. Ouvrez une **Pull Request**.


## Auteur

- **Abraham KOLOBOE** - [LinkedIn](https://www.linkedin.com/in/abraham-koloboe/) - [Email](mailto:abklb27@gmail.com)



**Remerciements** : Merci pour votre intérêt pour ce projet ! N'hésitez pas à me contacter pour toute question ou suggestion.