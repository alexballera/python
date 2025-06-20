FROM jupyter/base-notebook:latest

USER root

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    git \
    vim \
    curl \
    wget \
    graphviz \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

USER jovyan

# Copiar requirements
COPY requirements.txt /tmp/requirements.txt

# Instalar paquetes de Python
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Configurar Jupyter
RUN jupyter lab --generate-config && \
    echo "c.ServerApp.token = ''" >> ~/.jupyter/jupyter_lab_config.py && \
    echo "c.ServerApp.password = ''" >> ~/.jupyter/jupyter_lab_config.py && \
    echo "c.ServerApp.allow_root = True" >> ~/.jupyter/jupyter_lab_config.py && \
    echo "c.ServerApp.ip = '0.0.0.0'" >> ~/.jupyter/jupyter_lab_config.py

# Exponer puerto
EXPOSE 8888

# Comando por defecto
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
