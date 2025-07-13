# 🐍 Curso Modular de Python - Docker

Un curso completo de Python organizado en módulos independientes con ambientes Docker especializados.

## 🚀 Inicio Rápido

```bash
# Setup inicial (obligatorio)
make setup

# Iniciar módulo específico
make start-fundamentos  # Puerto 8888
make start-ml           # Puerto 8893

# Ver estado de contenedores
make status

# Detener todos los módulos
make stop-all
```

## 🏗️ Arquitectura

8 módulos independientes con puertos dedicados:

```
📚 modulos/
├── 01_fundamentos/     # 8888 - Python básico ✅
├── 02_poo/             # 8889 - Programación Orientada a Objetos ✅
├── 03_algoritmos/      # 8890 - Algoritmos y Estructuras ✅
├── 04_web/             # 8891 - Flask/Django ✅
├── 05_analisis_datos/  # 8892 - Pandas/NumPy ✅
├── 06_machine_learning/# 8893 - Scikit-learn ✅
├── 07_deep_learning/   # 8894 - TensorFlow/Keras 🔧
└── 08_proyectos/       # 8895 - Proyectos finales 🔧
```

## 🛠️ Comandos Principales

### Gestión de Módulos
```bash
make build-[modulo]     # Construir módulo específico
make start-[modulo]     # Iniciar módulo
make logs-[modulo]      # Ver logs en tiempo real
make reset-[modulo]     # Reset completo
```

### Utilidades
```bash
make clean-outputs-all  # Limpiar outputs notebooks (pre-commit)
make prepare-share     # Preparar para compartir
make docker-info       # Estado Docker completo
```

### Alternativa con manage.sh
```bash
./manage.sh start fundamentos
./manage.sh build ml
./manage.sh status
```

## 📋 Requisitos

- **Docker** y **Docker Compose**
- **Make** (para comandos automatizados)
- **Permisos**: `chmod +x manage.sh` si es necesario

## 🎯 Flujo de Trabajo

1. **Setup inicial**: `make setup` (construye imagen base)
2. **Desarrollo progresivo**: Empezar con `fundamentos`
3. **Múltiples módulos**: Usar puertos diferentes para trabajar en paralelo
4. **Pre-commit**: Siempre ejecutar `make clean-outputs-all`

## 🐳 Docker

- **Imagen base compartida**: Optimizada para todos los módulos
- **Perfiles independientes**: Cada módulo se ejecuta aisladamente
- **Volúmenes**: Notebooks persistentes + datos compartidos
- **Usuario no privilegiado**: Ejecución segura como `jovyan`

## 🔧 Troubleshooting

```bash
# Puerto ocupado
make stop-all && make start-[modulo]

# Imagen base no existe
make build-base

# Contenedores zombie
make clean-all

# Reset completo
make reset-all
```

## 📁 Estructura de Archivos

```
� python/
├── 🐳 docker-compose.yml   # Orquestación completa
├── 🛠️ Makefile            # 60+ comandos automatizados
├── 🛠️ manage.sh           # Script espejo de Makefile
├── 📊 data/               # Datasets compartidos
├── 🤖 modelos/            # Modelos ML/DL
└── � modulos/            # Módulos educativos
    └── XX_nombre/
        ├── Dockerfile
        ├── requirements.txt
        └── notebooks/
```

---

> **Estado**: ✅ Módulos 1-6 completamente funcionales | � Módulos 7-8 en desarrollo  
> **Comandos**: 60+ comandos make disponibles | **Alternativa**: manage.sh  
> **Optimizado**: Limpieza automática, reset por módulos, preparación para compartir
    ├── 02_poo/                # Puerto 8889
    ├── 03_algoritmos/         # Puerto 8890
    ├── 04_web/                # Puerto 8891
    ├── 05_analisis_datos/     # Puerto 8892
    ├── 06_machine_learning/   # Puerto 8893
    ├── 07_deep_learning/      # Puerto 8894
---

> **Estado**: ✅ Módulos 1-6 completamente funcionales | 🔧 Módulos 7-8 en desarrollo  
> **Comandos**: 60+ comandos make disponibles | **Alternativa**: manage.sh  
> **Optimizado**: Limpieza automática, reset por módulos, preparación para compartir

