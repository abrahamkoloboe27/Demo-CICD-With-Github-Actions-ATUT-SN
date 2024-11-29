# GitHub Actions : Automatisation Simplifiée pour Vos Projets

## Table des matières

- [GitHub Actions : Automatisation Simplifiée pour Vos Projets](#github-actions--automatisation-simplifiée-pour-vos-projets)
  - [Table des matières](#table-des-matières)
  - [Introduction](#introduction)
  - [Qu'est-ce que GitHub Actions ?](#quest-ce-que-github-actions-)
  - [Concepts Clés](#concepts-clés)
  - [Écrire un Workflow](#écrire-un-workflow)
    - [Exemple de Structure](#exemple-de-structure)
  - [Trouver et Utiliser des Actions](#trouver-et-utiliser-des-actions)
    - [Où Trouver des Actions ?](#où-trouver-des-actions-)
    - [Utiliser une Action](#utiliser-une-action)
    - [Créer une Action Personnalisée](#créer-une-action-personnalisée)
  - [Ressources et Documentation](#ressources-et-documentation)
  - [Exemples de Workflows](#exemples-de-workflows)
    - [1. Build et Push d'une Image Docker](#1-build-et-push-dune-image-docker)
    - [2. Exécution de Tests Automatisés](#2-exécution-de-tests-automatisés)
  - [Conclusion](#conclusion)

## Introduction

Bienvenue dans cette section dédiée à **GitHub Actions** ! GitHub Actions est une puissante plateforme d'intégration continue et de déploiement continu (CI/CD) intégrée directement dans GitHub. Elle permet d'automatiser, personnaliser et exécuter vos workflows de développement logiciel directement depuis votre dépôt GitHub.

## Qu'est-ce que GitHub Actions ?

**GitHub Actions** est un service d'automatisation proposé par GitHub, permettant aux développeurs de créer des workflows personnalisés pour automatiser des tâches telles que :

- **Intégration Continue (CI)** : Compiler et tester votre code à chaque push ou pull request.
- **Déploiement Continu (CD)** : Déployer automatiquement vos applications sur des serveurs ou des services cloud.
- **Automatisation de Tâches** : Gérer des tâches répétitives comme la gestion des issues, la mise à jour des dépendances, etc.

Avec GitHub Actions, vous pouvez définir des workflows qui s'exécutent en réponse à des événements spécifiques dans votre dépôt GitHub.

## Concepts Clés

Avant de plonger dans l'écriture des workflows, voici quelques concepts fondamentaux de GitHub Actions :

- **Workflow** :
  - Un workflow est un ensemble automatisé de tâches définies dans un fichier YAML situé dans le répertoire `.github/workflows/` de votre dépôt.
  - Il est déclenché par des événements spécifiques (comme un push, une pull request, etc.).
- **Action** :
  - Une action est une unité réutilisable de code qui peut être incluse dans vos workflows.
  - Les actions peuvent être créées par la communauté ou par vous-même pour accomplir des tâches spécifiques.
- **Runner** :
  - Un runner est une machine (auto-hébergée ou hébergée par GitHub) qui exécute les jobs de vos workflows.
- **Job** :
  - Un job est une série de steps (étapes) exécutées sur le même runner.
  - Les jobs peuvent être parallélisés ou dépendants les uns des autres.
- **Step** :
  - Une step est une tâche unique exécutée dans un job, pouvant être une commande shell ou une action.
- **Event** :
  - Un event est une action qui déclenche un workflow, comme un push, une issue ouverte, ou un planificateur (cron).

## Écrire un Workflow

Les workflows sont définis dans des fichiers YAML situés dans le répertoire `.github/workflows/` de votre dépôt. Voici la structure de base d'un fichier de workflow :

```yaml
name: Nom du Workflow

on:
  événement: [branche, type d'événement]

jobs:
  nom_du_job:
    runs-on: ubuntu-latest

    steps:
      - name: Étape 1
        uses: action/nom@version
      - name: Étape 2
        run: commande à exécuter
```

### Exemple de Structure

- **name** : Nom du workflow (affiché dans l'interface GitHub Actions).
- **on** : Définition des événements qui déclenchent le workflow.
- **jobs** : Liste des jobs à exécuter.
  - **runs-on** : Système d'exploitation du runner (par exemple, `ubuntu-latest`).
  - **steps** : Étapes individuelles au sein du job.
    - **uses** : Utilisation d'une action GitHub.
    - **run** : Exécution d'une commande shell.

## Trouver et Utiliser des Actions

### Où Trouver des Actions ?

GitHub propose un **Marketplace** où vous pouvez trouver des milliers d'actions créées par la communauté et par GitHub lui-même :

- [GitHub Marketplace - Actions](https://github.com/marketplace?type=actions)

### Utiliser une Action

Pour utiliser une action dans votre workflow, vous pouvez référencer son chemin ou son nom dans la section `uses`. Par exemple, pour utiliser l'action officielle checkout :

```yaml
steps:
  - name: Checkout Repository
    uses: actions/checkout@v3
```

### Créer une Action Personnalisée

Si les actions disponibles ne répondent pas à vos besoins, vous pouvez créer la vôtre. Voici les étapes de base :

1. **Créer un Répertoire** pour votre action, par exemple `.github/actions/mon-action`.
2. **Définir un fichier `action.yml`** avec les métadonnées de l'action.
3. **Ajouter le Code** de votre action (scripts, Dockerfile, etc.).

Pour plus de détails, consultez la [documentation officielle sur la création d'actions](https://docs.github.com/actions/creating-actions).

## Ressources et Documentation

- **Documentation Officielle de GitHub Actions** :
  - [Introduction à GitHub Actions](https://docs.github.com/actions/learn-github-actions/introduction-to-github-actions)
  - [Définir des Workflows](https://docs.github.com/actions/using-workflows/workflow-syntax-for-github-actions)
  - [GitHub Actions Marketplace](https://github.com/marketplace?type=actions)
- **Tutoriels et Guides** :
  - [Guide de Démarrage Rapide](https://docs.github.com/actions/quickstart)
  - [Créer une Action Personnalisée](https://docs.github.com/actions/creating-actions/creating-a-javascript-action)
- **Communauté et Support** :
  - [GitHub Community Discussions](https://github.community/c/code-to-cloud/github-actions/61)
  - [Stack Overflow - Tag GitHub Actions](https://stackoverflow.com/questions/tagged/github-actions)

## Exemples de Workflows

### 1. Build et Push d'une Image Docker

Ce workflow est déclenché à chaque push sur la branche principale. Il construit une image Docker et la pousse vers GitHub Container Registry (GHCR).

```yaml
name: Build and Push Docker Image

on:
  push:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      # Checkout du code source
      - name: Checkout Repository
        uses: actions/checkout@v3

      # Configuration de Docker Buildx
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v2

      # Login à GHCR
      - name: Login to GitHub Container Registry
        uses: docker/login-action@v2
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.GHCR_PAT }}

      # Build et push de l'image Docker
      - name: Build and Push Docker Image
        uses: docker/build-push-action@v4
        with:
          push: true
          tags: ghcr.io/${{ github.repository_owner }}/demo-cicd-atut-backend:latest
```

**Explications :**

- **Checkout Repository** : Récupère le code source du dépôt.
- **Set up Docker Buildx** : Configure Docker Buildx pour la construction avancée d'images.
- **Login to GHCR** : Authentifie Docker auprès de GitHub Container Registry en utilisant le secret `GHCR_PAT`.
- **Build and Push Docker Image** : Construit l'image Docker et la pousse vers GHCR avec le tag `latest`.

### 2. Exécution de Tests Automatisés

Ce workflow exécute des tests unitaires à chaque pull request vers la branche principale.

```yaml
name: Run Tests

on:
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
      # Checkout du code source
      - name: Checkout Repository
        uses: actions/checkout@v3

      # Configuration de Python
      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.9'

      # Installation des dépendances
      - name: Install Dependencies
        run: |
          python -m pip install --upgrade pip
          pip install -r requirements.txt

      # Exécution des tests
      - name: Run Tests
        run: |
          pytest
```

**Explications :**

- **Checkout Repository** : Récupère le code source du dépôt.
- **Set up Python** : Configure l'environnement Python avec la version spécifiée.
- **Install Dependencies** : Installe les dépendances nécessaires à l'aide de `pip`.
- **Run Tests** : Exécute les tests unitaires avec `pytest`.

## Conclusion

GitHub Actions est un outil puissant et flexible pour automatiser vos workflows de développement logiciel. Que ce soit pour construire et déployer vos applications, exécuter des tests automatisés ou gérer des tâches répétitives, GitHub Actions simplifie le processus et améliore l'efficacité de votre équipe.

En intégrant GitHub Actions dans votre projet de classification de fruits, vous bénéficiez d'une automatisation complète, garantissant que chaque modification de code est testée, construite et déployée de manière cohérente et fiable.

**Bon déploiement et automatisation avec GitHub Actions !**

Pour toute question ou assistance supplémentaire, n'hésitez pas à consulter la [documentation officielle](https://docs.github.com/actions) ou à rejoindre les [discussions de la communauté](https://github.community/c/code-to-cloud/github-actions/61).
