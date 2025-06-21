FROM python-base:latest

LABEL description="Module 3: Algorithms and Data Structures - Optimized"
LABEL version="2.0"

# Instalar dependencias específicas para algoritmos
USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    graphviz \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
USER jupyter

# Copiar requirements
# Copiar requirements específicos
COPY --chown=jupyter:jupyter requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Exponer puerto
EXPOSE 8888

# Comando por defecto
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser"]
