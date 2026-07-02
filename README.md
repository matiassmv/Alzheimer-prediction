# Alzheimer Prediction & Model Comparison

Este repositorio contiene una investigación aplicada de Deep Learning para la clasificación de etapas de Alzheimer utilizando imágenes de resonancia magnética (MRI).

Incluye el entrenamiento de una red neuronal convolucional base (MobileNetV2) y su posterior mejora mediante la búsqueda automatizada de hiperparámetros utilizando **Optuna**. Finalmente, integra una aplicación web interactiva creada con **Gradio** para comparar el rendimiento de ambos modelos en tiempo real.

## Instalación y Configuración

Para clonar y ejecutar este proyecto en tu máquina local, sigue estos pasos:

### 1. Descargar el Dataset

Para mantener el repositorio ligero, las imágenes de entrenamiento no están incluidas.

1. Descarga el dataset oficial desde Kaggle: [Kaggle](https://www.kaggle.com/datasets/uraninjo/augmented-alzheimer-mri-dataset?resource=download)
2. Descomprime el archivo descargado.
3. Asegúrate de que la carpeta resultante se llame exactamente `AugmentedAlzheimerDataset` y colócala en la raíz de este proyecto.

### 2. Configurar el Entorno Virtual

El proyecto requiere configuraciones específicas de librerías (como TensorFlow 2.10). Para automatizar la instalación:

- Ejecuta el archivo **`setup_tf210.bat`**.
- Este script creará un entorno virtual aislado llamado `tf210` e instalará todas las dependencias necesarias sin afectar tu instalación global de Python.

### 3. Entrenar y Generar los Modelos (.h5)

Por restricciones de tamaño en GitHub, los modelos pre-entrenados no están incluidos. Debes generarlos localmente ejecutando los notebooks:

1. Activa tu entorno virtual (`.\tf210\Scripts\activate`) y abre Jupyter.
2. Ejecuta mínimo hasta la celda 13 (model.save) de **`augmented_alzheimer.ipynb`**. Se guardará el archivo `Alzheimer_Model.h5` en tu carpeta.
3. Ejecuta mínimo hasta la celda 18 (model_final.save) **`augmented_alzheimer_optuna.ipynb`**. Esto realizará la búsqueda de hiperparámetros y guardará el modelo optimizado como `Alzheimer_Model_Optimized.h5`.

_(Nota: Para evitar el entrenamiento, puedes descargar los modelos pre-entrenados directamente desde [Drive](https://drive.google.com/drive/folders/1rIhqAS-LdmjagKSW2ukTHI_pAD20aWZ-?usp=sharing) y colocarlos en la raíz del proyecto)._

### 4. Ejecutar la Aplicación Interactiva

Una vez que el dataset esté en su lugar y el entorno instalado:

1. Abre tu terminal.
2. Activa el entorno virtual ejecutando: `.\tf210\Scripts\activate`
3. Ejecuta la interfaz gráfica con: `python app.py`
4. Abre el enlace local (usualmente `http://127.0.0.1:7860`) en tu navegador para interactuar con los modelos.

## Estructura del Proyecto

- `augmented_alzheimer.ipynb`: Notebook con el preprocesamiento de datos y el entrenamiento del modelo base.
- `augmented_alzheimer_optuna.ipynb`: Notebook enfocado en la optimización de hiperparámetros (Learning Rate, Dropout, Nodos) para maximizar la precisión.
- `model_compararation.ipynb`: Script de evaluación cara a cara de ambos modelos contra el set de pruebas.
- `app.py`: Interfaz gráfica (Frontend) para la predicción de imágenes individuales.
