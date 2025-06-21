FROM python:3.11-slim

LABEL maintainer="Curso Modular Python <info@cursomodularpython.com>"
LABEL description="Base Image for Python Modular Course"
LABEL version="2.0"

# Configuración para reducir el tamaño de la imagen
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=off \
    DEBIAN_FRONTEND=noninteractive

# Instalar dependencias comunes del sistema
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    vim-tiny \
    curl \
    procps \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Crear usuario no-root para seguridad
RUN groupadd -g 1000 jupyter && \
    useradd -m -u 1000 -g jupyter jupyter

USER jupyter
WORKDIR /home/jupyter/work

# Crear un entorno virtual para tener las dependencias aisladas
RUN python -m venv /home/jupyter/venv
ENV PATH="/home/jupyter/venv/bin:$PATH"

# Instalar jupyter y dependencias básicas
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir \
    jupyterlab==4.0.9 \
    notebook==7.0.6 \
    ipywidgets==8.1.1 \
    ipykernel==6.28.0 \
    nbconvert==7.12.0 \
    matplotlib==3.8.2 \
    pandas==2.1.4 \
    numpy==1.26.3 \
    pytest==7.4.3

# Configuración de seguridad de Jupyter
RUN mkdir -p ~/.jupyter && \
    echo "c.ServerApp.token = ''" >> ~/.jupyter/jupyter_lab_config.py && \
    echo "c.ServerApp.password = ''" >> ~/.jupyter/jupyter_lab_config.py && \
    echo "c.ServerApp.allow_root = False" >> ~/.jupyter/jupyter_lab_config.py && \
    echo "c.ServerApp.ip = '0.0.0.0'" >> ~/.jupyter/jupyter_lab_config.py && \
    echo "c.ServerApp.notebook_dir = '/home/jupyter/work'" >> ~/.jupyter/jupyter_lab_config.py

# Script de entrada que verifica el entorno
COPY --chown=jupyter:jupyter entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["jupyter", "lab", "--no-browser"]
