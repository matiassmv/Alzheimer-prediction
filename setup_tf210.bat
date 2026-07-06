@echo off

if exist tf210 (
    rmdir /S /Q tf210
)

echo.
echo ==========================================
echo  CREANDO VENV CON PYTHON 3.10
echo ==========================================

py -3.10 -m venv tf210

call tf210\Scripts\activate

python --version

echo.
echo ==========================================
echo  ACTUALIZANDO PIP
echo ==========================================

python -m pip install --upgrade pip setuptools wheel

echo.
echo ==========================================
echo  INSTALANDO NUMPY COMPATIBLE
echo ==========================================

pip install numpy==1.24.3

echo.
echo ==========================================
echo  INSTALANDO TENSORFLOW GPU
echo ==========================================

pip install tensorflow==2.10.1

echo.
echo ==========================================
echo  INSTALANDO PAQUETES NECESARIOS
echo ==========================================

pip install ^
scipy==1.10.1 ^
scikit-learn==1.3.2 ^
pandas==2.0.3 ^
matplotlib==3.7.5 ^
seaborn==0.13.2 ^
opencv-python==4.8.1.78 ^
pillow==10.4.0 ^
notebook ^
jupyterlab ^
ipykernel ^
optuna ^
optuna-integration ^
gradio

echo.
echo ==========================================
echo  REGISTRANDO KERNEL
echo ==========================================

python -m ipykernel install --user --name=tf210 --display-name="Python (TF2.10 GPU)"

echo.
echo ==========================================
echo  VERSIONES INSTALADAS
echo ==========================================

python -c "import tensorflow as tf;import numpy;print('TensorFlow:',tf.__version__);print('NumPy:',numpy.__version__);print(tf.config.list_physical_devices('GPU'))"

pause