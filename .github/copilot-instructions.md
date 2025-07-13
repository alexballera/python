# Instrucciones para Agentes de IA - Curso Modular de Python

## 🚨 **CONTEXTO CRÍTICO - LEE ESTO PRIMERO**

### **Ubicación y Ambiente**
- **Directorio de trabajo**: **Raíz del proyecto curso Python** (donde están docker-compose.yml, Makefile, manage.sh)
- **Sistema**: Linux (bash shell)
- **Ambiente principal**: **Docker containers con Jupyter notebooks**
- **Idioma**: **SIEMPRE responder en ESPAÑOL**
- **NO usar Python local** - todo funciona dentro de contenedores Docker

### **Estado Actual del Proyecto (Julio 2025)**
- ✅ **Módulos 1-6**: Completamente funcionales
- 🔧 **Módulos 7-8**: Estructura creada, contenido pendiente
- 🔴 **NUNCA** asumir que algo está "instalado localmente"
- 🔴 **SIEMPRE** usar comandos make o manage.sh

### **Flujo de Trabajo Obligatorio**
1. **ANTES de cualquier acción**: verificar estado con `make status`
2. **Para construir**: SIEMPRE usar `make build-[modulo]` o `make setup`
3. **Para iniciar**: SIEMPRE usar `make start-[modulo]`
4. **Para debugging**: usar `make logs-[modulo]` y `docker ps`
5. **Antes de commits**: SIEMPRE ejecutar `make clean-outputs-all`

### **Comandos que NUNCA debes sugerir**
- ❌ `pip install` (todo está en Docker)
- ❌ `python script.py` (usar notebooks en containers)
- ❌ `jupyter notebook` directamente (usar make start-*)
- ❌ `docker run` manual (usar docker-compose con perfiles)

### **Comandos que SÍ debes usar siempre**
- ✅ `make status` - verificar estado
- ✅ `make start-[modulo]` - iniciar ambiente
- ✅ `make logs-[modulo]` - debug problemas
- ✅ `make build-[modulo]` - construir imágenes
- ✅ `make clean-outputs-all` - limpiar antes de compartir

## 🏗️ Arquitectura del Proyecto

Este es un **curso modular de Python dockerizado** con 8 módulos independientes, cada uno con su propio ambiente Docker especializado y puerto dedicado:

```
📚 modulos/
├── 01_fundamentos/     # Puerto 8888 - Python básico
├── 02_poo/             # Puerto 8889 - Programación Orientada a Objetos  
├── 03_algoritmos/      # Puerto 8890 - Algoritmos y Estructuras de Datos
├── 04_web/             # Puerto 8891 - Desarrollo Web (Flask/Django)
├── 05_analisis_datos/  # Puerto 8892 - Pandas, NumPy, visualización
├── 06_machine_learning/# Puerto 8893 - Scikit-learn, XGBoost
├── 07_deep_learning/   # Puerto 8894 - TensorFlow, Keras
└── 08_proyectos/       # Puerto 8895 - Proyectos integrados
```

## 🛠️ Flujos de Trabajo Esenciales

### Sistema Dual de Gestión
El proyecto tiene **dos interfaces de comando equivalentes**:

1. **Makefile (Recomendado)**: `make start-fundamentos`, `make build-ml`, `make clean-all`
2. **Script manage.sh**: `./manage.sh start fundamentos`, `./manage.sh build ml`

### Comandos Críticos
```bash
# Configuración inicial (OBLIGATORIO)
make setup                    # O: ./manage.sh build-base

# Construcción por módulo
make build-fundamentos        # O: ./manage.sh build fundamentos
make build-ml                 # O: ./manage.sh build ml

# Gestión de servicios
make start-ml                 # Inicia en puerto 8893
make stop-all                 # Detiene todos los módulos
make status                   # Estado de contenedores Docker

# Limpieza (crucial antes de compartir)
make clean-outputs-all        # Limpia outputs de notebooks
make prepare-share           # Prepara proyecto para compartir
make reset-fundamentos       # Reset completo de un módulo
```

## 🐳 Patrones Docker Específicos

### Arquitectura de Perfiles
Cada módulo usa **Docker Compose profiles** para aislamiento:
```yaml
services:
  ml:
    profiles: ["ml"]          # Solo se inicia con --profile ml
    ports: ["8893:8888"]      # Puerto externo específico
```

### Dependencia de Imagen Base
**CRÍTICO**: Todos los módulos dependen de `python-base:latest`:
- Primero ejecutar: `make build-base` o `./manage.sh build-base`
- Luego construir módulos individuales

### Montaje de Volúmenes Estándar
```yaml
volumes:
  - ./modulos/XX_nombre/notebooks:/home/jovyan/work
  - ./data:/home/jovyan/data        # Datasets compartidos
  - ./modelos:/home/jovyan/modelos  # Solo para ML/DL
```

## 📁 Convenciones de Estructura

### Estructura Estándar por Módulo
```
modulos/XX_nombre/
├── Dockerfile              # Imagen especializada
├── requirements.txt         # Dependencias específicas
└── notebooks/
    └── 01_*.ipynb          # Notebooks educativos
```

### Mapeo de Nombres de Módulos
El script `manage.sh` mapea nombres cortos a directorios:
```bash
fundamentos -> 01_fundamentos
poo         -> 02_poo
ml          -> 06_machine_learning
dl          -> 07_deep_learning
```

## 🧹 Gestión de Estado

### Limpieza Automática
El proyecto incluye limpieza automática de:
- **Outputs de notebooks**: `.ipynb_checkpoints/`, celdas ejecutadas
- **Archivos temporales**: `*.pyc`, `__pycache__/`
- **Contenedores Docker**: Imágenes no utilizadas

### Reset de Módulos
```bash
make reset-ml                # Detiene + limpia outputs + archivos temporales
make reset-all              # Reset completo del proyecto
```

## 🎯 Patrones de Desarrollo

### Flujo Secuencial Recomendado
1. **Setup inicial**: `make setup`
2. **Desarrollo progresivo**: Empezar con `fundamentos`, avanzar secuencialmente
3. **Múltiples módulos**: Usar puertos diferentes para trabajar en paralelo
4. **Gestión de recursos**: Detener módulos no utilizados

### Debugging y Monitoreo
```bash
make logs-ml                # Ver logs en tiempo real
make docker-info            # Estado completo de Docker
make ports                  # Lista de puertos por módulo
```

## 🔄 Estados de Módulos

### Estados Implementados
- ✅ **Módulos 1-6**: Completamente funcionales
- 🔧 **Módulos 7-8**: Estructura lista, pendiente de contenido

### Validación de Estado
```bash
make status                 # Ver contenedores activos
docker ps                   # Verificar salud de contenedores
```

## 📝 Consideraciones para Edición

### Al Trabajar con Notebooks
- **Siempre** limpiar outputs antes de commits: `make clean-outputs-all`
- Usar `make prepare-share` antes de compartir el proyecto
- Los notebooks están en `/notebooks/` dentro de cada módulo

### Al Modificar Docker
- Rebuilds requieren detener el servicio primero: `make stop-ml && make build-ml`
- Cambios en `requirements.txt` necesitan rebuild completo
- La imagen base se comparte entre módulos para eficiencia

### Al Agregar Módulos
- Seguir convención de nombres: `XX_nombre/`
- Actualizar `manage.sh`: función `get_module_path()` y array `valid_modules`
- Agregar perfil en `docker-compose.yml`
- Incluir comandos en `Makefile`

## 🚨 Errores Comunes

1. **"imagen base no existe"**: Ejecutar `make build-base` primero
2. **Puerto ocupado**: Verificar con `make status`, detener módulos no utilizados
3. **Permisos de manage.sh**: Ejecutar `chmod +x manage.sh` o `make permissions`
4. **Contenedores zombie**: Limpiar con `make clean-all`

## 🎯 **REGLAS DE ORO PARA AGENTES**

### **SIEMPRE hacer esto ANTES de responder:**
1. **Responder en ESPAÑOL** - el usuario es hispanohablante
2. **Verificar que estamos en el directorio raíz del curso Python** (debe existir docker-compose.yml, Makefile, manage.sh)
3. Recordar que TODO funciona con Docker containers
4. Usar comandos `make` como primera opción
5. Verificar estado con `make status` si hay dudas

### **NUNCA sugerir:**
- Instalaciones locales de Python packages
- Comandos docker run manuales  
- Ejecutar Python scripts fuera de containers
- Modificar archivos de sistema
- **Responder en inglés** (solo español)

### **SIEMPRE preguntar si no estás seguro de:**
- En qué módulo específico está trabajando el usuario
- Si un container debe estar corriendo o detenido
- Si se necesita rebuild después de cambios

### **Respuestas típicas que debes dar:**
- Usuario: "Instala pandas" → "pandas ya está en el contenedor. Usa `make start-analisis` para trabajar con análisis de datos"
- Usuario: "No funciona el notebook" → "Verifico el estado: `make status`. ¿Qué módulo estás usando?"
- Usuario: "Error de puerto" → "Puerto ocupado. Usa `make stop-all` y luego `make start-[modulo]`"
- **Todas las respuestas en español, con explicaciones claras y comandos específicos**
