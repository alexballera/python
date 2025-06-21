#!/bin/bash
set -e

# Script de entrada para las imágenes Docker del curso
echo "🐍 Inicializando entorno para el Curso Modular de Python..."

# Verificar que el entorno virtual existe y está activado
if [ ! -d "/home/jupyter/venv" ]; then
    echo "❌ Error: Entorno virtual no encontrado!"
    exit 1
fi

# Verificar instalación de Jupyter
if ! command -v jupyter &> /dev/null; then
    echo "❌ Error: Jupyter no está instalado correctamente!"
    exit 1
fi

# Verificar kernel de Python
if ! python -c "import ipykernel" &> /dev/null; then
    echo "❌ Error: ipykernel no está instalado!"
    pip install ipykernel
    python -m ipykernel install --user
fi

# Verificar permisos en directorio de trabajo
if [ ! -w "/home/jupyter/work" ]; then
    echo "❌ Error: No hay permisos de escritura en el directorio de trabajo!"
    exit 1
fi

echo "✅ Entorno verificado y listo!"
echo "🚀 Iniciando $*"
exec "$@"
