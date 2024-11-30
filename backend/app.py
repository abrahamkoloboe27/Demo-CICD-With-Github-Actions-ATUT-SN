import keras
import numpy as np
import logging
from fastapi import FastAPI, UploadFile, File
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
import os
import shutil
import warnings
warnings.filterwarnings("ignore")



# Configuration du logging
logging.basicConfig(
    level=logging.INFO, 
    format='%(asctime)s - %(levelname)s - %(message)s'
)


# Après l'initialisation de app = FastAPI(...)

# Configuration des origines autorisées
origins = [
    "http://localhost",
    "http://localhost:80",    # Pour d'autres services
    "*"                         # Pour autoriser toutes les origines
]



description = """
## API de Classification d'Images de Fruits 🍎🍌

Cette API utilise un modèle de deep learning pour classifier des images de fruits.

**Fonctionnalités :**

- **Prédiction** : Téléchargez une image de fruit, et l'API retournera la classe correspondante ainsi que le score de confiance.
- **Support** : Compatible avec les images aux formats JPEG et PNG.
- **Documentation interactive** : Testez l'API directement via l'interface Swagger UI.

**Note** : Assurez-vous que l'image est claire et centrée sur le fruit pour une meilleure précision.

"""

# Initialisation de l'application FastAPI
app = FastAPI(
    title="API de Classification d'Images de Fruits",
    description=description,
    version="1.0",
    contact={
        "name": "Abraham KOLOBOE",
        "email": "abklb27@gmail.com"
    }
)

# Ajout du middleware CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],        # Autorise toutes les méthodes HTTP
    allow_headers=["*"]         # Autorise tous les headers
)

# Taille des images attendues par le modèle
image_size = (100, 100)

def load_model():
    """
    Charge le modèle de deep learning pré-entraîné en mémoire.
    """
    global model
    try:
        model = keras.models.load_model('model/best_model_cnn.keras')
        logging.info('Modèle chargé avec succès.')
    except Exception as e:
        logging.error(f'Erreur lors du chargement du modèle : {e}')

def load_image_and_predict(image_path):
    """
    Charge une image, la prétraite et effectue une prédiction.

    Args:
        image_path (str): Chemin vers l'image à prédire.

    Returns:
        tuple: Indice de la classe prédite, score de confiance.

    Raises:
        Exception: En cas d'erreur lors du chargement ou de la prédiction.
    """
    try:
        logging.info(f"Chargement et prétraitement de l'image depuis {image_path}.")
        # Chargement de l'image avec la taille appropriée
        img = keras.preprocessing.image.load_img(image_path, target_size=image_size)
        img_array = keras.preprocessing.image.img_to_array(img)
        img_array = np.expand_dims(img_array, axis=0)

        logging.info("Réalisation de la prédiction.")
        # Prédiction avec le modèle chargé
        predictions = model.predict(img_array)
        predicted_class_index = np.argmax(predictions, axis=1)[0]
        confidence = np.max(predictions, axis=1)[0]

        return predicted_class_index, confidence
    except Exception as e:
        logging.error(f"Erreur dans load_image_and_predict : {e}")
        raise

@app.on_event("startup")
async def startup_event():
    """
    Événement déclenché au démarrage de l'application.
    Charge le modèle de deep learning en mémoire.
    """
    load_model()
    logging.info('Démarrage de l\'application.')

def get_class_names():
    """
    Récupère la liste des noms de classes à partir d'un fichier texte.

    Returns:
        list: Liste des noms de classes (str).
    """
    with open('class_names.txt', 'r') as file:
        class_names = file.readlines()
    return [class_name.strip() for class_name in class_names]

# Chargement des noms de classes
class_names = get_class_names()
logging.info('Noms des classes chargés avec succès.')

@app.get("/", tags=["Introduction"])
async def read_root():
    """
    Endpoint racine de l'API.

    Returns:
        dict: Message de bienvenue.
    """
    logging.info("Accès à l'endpoint racine.")
    return {"message": "Bienvenue sur l'API de Classification d'Images de Fruits 🍓🍍"}

@app.post("/predict", tags=["Prédiction"])
async def predict(file: UploadFile = File(...)):
    """
    Prédire la classe d'un fruit à partir d'une image.

    Args:
        file (UploadFile): Image du fruit à analyser.

    Returns:
        JSONResponse: Contient la classe prédite et le score de confiance.

    Raises:
        JSONResponse: En cas d'erreur, retourne un message d'erreur avec le statut HTTP approprié.
    """
    logging.info("Requête POST sur l'endpoint /predict.")
    try:
        # Enregistrement du fichier uploadé dans un répertoire temporaire
        file_location = f"temp/{file.filename}"
        os.makedirs(os.path.dirname(file_location), exist_ok=True)
        with open(file_location, "wb") as buffer:
            shutil.copyfileobj(file.file, buffer)

        logging.info(f"Image reçue : {file.filename}")

        # Prédiction sur l'image uploadée
        predicted_class_index, confidence = load_image_and_predict(file_location)
        predicted_class_name = class_names[predicted_class_index]

        # Suppression du fichier temporaire
        os.remove(file_location)
        logging.info(f"Classe prédite : {predicted_class_name}, Score de confiance : {confidence}")
        # Retour de la réponse JSON avec la classe prédite et le score de confiance
        return JSONResponse(content={
            "predicted_class": predicted_class_name,
            "confidence": round(float(confidence) * 100, 2)
        })
    except Exception as e:
        logging.error(f"Erreur lors de la prédiction : {e}")
        return JSONResponse(content={"error": "Une erreur est survenue lors de la prédiction."}, status_code=500)
