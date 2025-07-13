# CONTEXTO RÁPIDO - Curso Python Docker

## 🚨 CRÍTICO
- **Directorio**: Raíz del curso Python (debe tener docker-compose.yml, Makefile, manage.sh)
- **Docker obligatorio**: NO usar Python local
- **Idioma**: **SIEMPRE ESPAÑOL**

## ⚡ Comandos Clave
```bash
make setup              # Setup inicial
make start-fundamentos  # Iniciar módulo (puerto 8888)
make start-ml           # ML (puerto 8893)
make status             # Ver estado
make stop-all           # Detener todo
make clean-outputs-all  # Limpiar antes commits
```

## 📚 Módulos (Puertos 8888-8895)
- **01_fundamentos** (8888) - **02_poo** (8889) - **03_algoritmos** (8890)
- **04_web** (8891) - **05_analisis** (8892) - **06_ml** (8893)
- **07_dl** (8894) - **08_proyectos** (8895)

## 🛠️ Alternativa
```bash
./manage.sh start fundamentos
./manage.sh build ml
```

**NUNCA sugerir**: pip install, python local, docker run manual
