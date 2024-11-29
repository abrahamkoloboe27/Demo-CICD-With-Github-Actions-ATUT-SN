# 📚 Référence Rapide : Docker & Docker Compose

Dans ce guide, nous allons vous fournir un rappel essentiel sur **Docker** et **Docker Compose**. Ces outils sont indispensables pour la conteneurisation et l'orchestration de vos applications. Que vous soyez débutant ou que vous ayez besoin d'une petite révision, cette section vous aidera à mieux comprendre et utiliser Docker dans votre projet de classification de fruits 🍎🚀.



## 🐳 Docker

### **Qu'est-ce que Docker ?**

**Docker** est une plateforme de conteneurisation qui permet de créer, déployer et exécuter des applications dans des conteneurs légers et portables. Un conteneur encapsule une application avec toutes ses dépendances, garantissant ainsi qu'elle fonctionne de manière cohérente quel que soit l'environnement.

### **Concepts de Base**

- **Image Docker** 🖼️ :
  - Une image est une **capture instantanée** d'un environnement logiciel, incluant le code, les bibliothèques, les dépendances et les configurations nécessaires pour exécuter une application.
  - Les images sont **lues seule** et peuvent être partagées via des registres comme [Docker Hub](https://hub.docker.com/) ou [GitHub Container Registry (GHCR)](https://ghcr.io/).

- **Conteneur Docker** 📦 :
  - Un conteneur est une instance en cours d'exécution d'une image Docker. Il est **isolé** du reste du système, ce qui assure une **portabilité** et une **consistance** entre les différents environnements.
  - Les conteneurs partagent le **noyau** du système d'exploitation mais restent **indépendants** les uns des autres.

### **Commandes de Base**

Voici quelques commandes essentielles pour travailler avec Docker :

- **Télécharger une image depuis un registre** :
  ```bash
  docker pull <nom_de_l'image>
  ```
  *Exemple :*
  ```bash
  docker pull nginx:latest
  ```

- **Lister les images locales** :
  ```bash
  docker images
  ```

- **Construire une image à partir d'un Dockerfile** :
  ```bash
  docker build -t <nom_de_l'image> .
  ```
  *Exemple :*
  ```bash
  docker build -t demo-cicd-atut-backend Backend/
  ```

- **Exécuter un conteneur** :
  ```bash
  docker run -d -p <port_local>:<port_conteneur> <nom_de_l'image>
  ```
  *Exemple :*
  ```bash
  docker run -d -p 80:80 demo-cicd-atut-frontend
  ```

- **Lister les conteneurs en cours d'exécution** :
  ```bash
  docker ps
  ```

- **Arrêter un conteneur** :
  ```bash
  docker stop <id_ou_nom_du_conteneur>
  ```

- **Supprimer un conteneur** :
  ```bash
  docker rm <id_ou_nom_du_conteneur>
  ```

- **Supprimer une image** :
  ```bash
  docker rmi <nom_de_l'image>
  ```

### **Accès et Gestion**

- **Accéder au terminal d'un conteneur en cours d'exécution** :
  ```bash
  docker exec -it <id_ou_nom_du_conteneur> /bin/bash
  ```

- **Vérifier les logs d'un conteneur** :
  ```bash
  docker logs <id_ou_nom_du_conteneur>
  ```

### **Ressources Utiles**

- [Documentation Officielle de Docker](https://docs.docker.com/)
- [Docker Hub](https://hub.docker.com/)
- [GitHub Container Registry (GHCR)](https://ghcr.io/)



## 📝 Docker Compose

### **Qu'est-ce que Docker Compose ?**

**Docker Compose** est un outil permettant de définir et de gérer des applications multi-conteneurs. Avec un fichier de configuration YAML (`docker-compose.yml`), vous pouvez orchestrer plusieurs conteneurs, définir leurs interactions, réseaux, volumes, et bien plus encore, facilitant ainsi le déploiement et la gestion de votre application.

### **Concepts de Base**

- **Fichier `docker-compose.yml`** 📄 :
  - Un fichier YAML où vous définissez les services (conteneurs), les réseaux et les volumes nécessaires à votre application.
  - Permet de **décrire** l'architecture de votre application de manière déclarative.

- **Services** 🛠️ :
  - Représentent les différents conteneurs nécessaires à votre application (par exemple, backend, frontend, base de données).
  - Chaque service peut avoir ses propres configurations (ports, volumes, variables d'environnement).

- **Réseaux** 🌐 :
  - Permettent aux conteneurs de communiquer entre eux de manière isolée.
  - Par défaut, Docker Compose crée un réseau dédié pour votre application.

- **Volumes** 💾 :
  - Utilisés pour persister les données générées et utilisées par les conteneurs.
  - Permettent de **partager** des données entre le conteneur et l'hôte ou entre plusieurs conteneurs.

### **Structure d'un Fichier `docker-compose.yml`**

Voici un exemple simplifié de fichier `docker-compose.yml` :

```yaml
version: '3'

services:
  frontend:
    image: ghcr.io/abrahamkoloboe27/demo-cicd-atut-frontend:latest
    container_name: frontend
    ports:
      - "80:80"
    networks:
      - demo-cicd-atut-network
    volumes:
      - frontend-data

  backend:
    image: ghcr.io/abrahamkoloboe27/demo-cicd-atut-backend:latest
    container_name: backend
    ports:
      - "8080:8080"
    networks:
      - demo-cicd-atut-network
    volumes:
      - backend-data

networks:
  demo-cicd-atut-network:
    driver: bridge

volumes:
  frontend-data:
  backend-data:
```

### **Commandes de Base**

- **Lancer les services définis dans `docker-compose.yml`** :
  ```bash
  docker-compose up -d
  ```
  *- `-d` exécute les conteneurs en arrière-plan (mode détaché).*

- **Arrêter les services** :
  ```bash
  docker-compose down
  ```
  *- Cette commande arrête et supprime les conteneurs, réseaux et volumes créés par `up`.*

- **Construire ou reconstruire les services** :
  ```bash
  docker-compose build
  ```

- **Lister les conteneurs gérés par Docker Compose** :
  ```bash
  docker-compose ps
  ```

- **Voir les logs des services** :
  ```bash
  docker-compose logs
  ```
  *- Pour suivre les logs en temps réel, utilisez `docker-compose logs -f`.*

### **Avantages de Docker Compose**

- **Simplification du Déploiement** 🛠️ :
  - Gère plusieurs conteneurs avec une seule commande.
  - Facilite la configuration et le lancement d'environnements complexes.

- **Gestion des Dépendances** 🔗 :
  - Définit clairement les dépendances entre les différents services de l'application.

- **Portabilité** 🌍 :
  - Le même fichier `docker-compose.yml` peut être utilisé en développement, test et production.

### **Ressources Utiles**

- [Documentation Officielle de Docker Compose](https://docs.docker.com/compose/)
- [Guide de Démarrage Rapide avec Docker Compose](https://docs.docker.com/compose/gettingstarted/)


