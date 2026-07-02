import gradio as gr
import tensorflow as tf
import numpy as np

print("Cargando modelos en memoria...")
modelo_original = tf.keras.models.load_model("Alzheimer_Model.h5")
modelo_optimizado = tf.keras.models.load_model("Alzheimer_Model_Optimized.h5")

clases = ['Mild Demented', 'Moderate Demented', 'Non Demented', 'Very Mild Demented']

def predecir_mri(img):
    img_resized = tf.image.resize(img, [244, 244])
    
    img_array = tf.expand_dims(img_resized, 0)
    
    img_preprocesada = tf.keras.applications.mobilenet_v2.preprocess_input(img_array)
    
    pred_orig = modelo_original.predict(img_preprocesada, verbose=0)[0]
    pred_opt = modelo_optimizado.predict(img_preprocesada, verbose=0)[0]
    
    resultado_original = {clases[i]: float(pred_orig[i]) for i in range(4)}
    resultado_optimizado = {clases[i]: float(pred_opt[i]) for i in range(4)}
    
    return resultado_original, resultado_optimizado

app = gr.Interface(
    fn=predecir_mri,
    inputs=gr.Image(label="Sube una MRI del dataset"), 
    outputs=[
        gr.Label(num_top_classes=4, label="Modelo Original"),
        gr.Label(num_top_classes=4, label="Modelo Optimizado (Optuna)")
    ],
    title="Comparador de Modelos: Detección de Alzheimer",
    description="Sube una imagen de resonancia magnética para evaluar el rendimiento de la red neuronal base frente a la versión optimizada."
)

if __name__ == "__main__":
    print("Iniciando interfaz gráfica...")
    app.launch()