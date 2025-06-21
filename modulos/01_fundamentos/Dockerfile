FROM python-base:latest

LABEL description="Module 1: Python Fundamentals - Optimized"
LABEL version="2.0"

# Copiar requirements específicos del módulo y optimizar instalación
COPY --chown=jupyter:jupyter requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Exponer puerto
EXPOSE 8888

# Comando por defecto
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
