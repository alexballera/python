# 🐍 Curso Completo de Python - Modular y Dockerizado

Un curso completo de Python desde fundamentos hasta ciencias de datos, organizado en módulos independientes con ambientes Docker especializados.

## 🎯 Objetivos del Curso

Este curso está diseñado para llevarte desde principiante absoluto hasta desarrollador avanzado en Python, con enfoque especial en:

- **Fundamentos sólidos** de programación
- **Programación Orientada a Objetos** y patrones de diseño
- **Algoritmos y Estructuras de Datos** eficientes
- **Desarrollo Web** con frameworks modernos
- **Análisis de Datos** con herramientas profesionales
- **Machine Learning** y aplicaciones prácticas
- **Deep Learning** y redes neuronales
- **Proyectos reales** y deployment

## 🏗️ Arquitectura Modular

Cada módulo tiene su propio ambiente Docker con las dependencias específicas necesarias:

```
📁 python/
├── 🐳 docker-compose.yml      # Orquestación de todos los módulos
├── 🛠️  manage.sh              # Script de gestión
├── 📊 data/                   # Datasets compartidos
├── 🤖 modelos/                # Modelos de ML/DL
├── 🚀 proyectos/              # Proyectos finales
└── 📚 modulos/
    ├── 01_fundamentos/        # Puerto 8888
    ├── 02_poo/                # Puerto 8889
    ├── 03_algoritmos/         # Puerto 8890
    ├── 04_web/                # Puerto 8891
    ├── 05_analisis_datos/     # Puerto 8892
    ├── 06_machine_learning/   # Puerto 8893
    ├── 07_deep_learning/      # Puerto 8894
    └── 08_proyectos/          # Puerto 8895
```

## 📚 Módulos del Curso

### 🐍 Módulo 1: Fundamentos de Python
**Puerto: 8888** | **Duración: 2-3 semanas**

- Variables y tipos de datos
- Operadores y expresiones  
- Estructuras de control (if, while, for)
- Funciones y módulos
- Manejo de archivos
- Excepciones básicas
- **Proyecto**: Sistema de gestión de biblioteca

**Tecnologías**: Python básico, Jupyter Lab

### 🏗️ Módulo 2: Programación Orientada a Objetos  
**Puerto: 8889** | **Duración: 2-3 semanas**

- Clases y objetos
- Herencia y polimorfismo
- Encapsulación y abstracción
- Métodos especiales (__init__, __str__, etc.)
- Patrones de diseño (Singleton, Factory, Observer)
- **Proyecto**: Sistema de gestión de empleados con jerarquías

**Tecnologías**: Python OOP, UML, Patrones de diseño

### 🧮 Módulo 3: Algoritmos y Estructuras de Datos
**Puerto: 8890** | **Duración: 3-4 semanas**

- Complejidad algorítmica (Big O)
- Listas, pilas, colas
- Árboles y grafos
- Algoritmos de ordenamiento
- Algoritmos de búsqueda
- Programación dinámica
- **Proyecto**: Motor de búsqueda básico

**Tecnologías**: NumPy, NetworkX, visualización de algoritmos

### 🌐 Módulo 4: Desarrollo Web
**Puerto: 8891** | **Duración: 4-5 semanas**

- Flask: APIs REST básicas
- Django: Aplicaciones web completas
- FastAPI: APIs modernas y rápidas
- Bases de datos (SQLite, PostgreSQL)
- Autenticación y autorización
- Testing web
- **Proyecto**: Aplicación web de blog con API REST

**Tecnologías**: Flask, Django, FastAPI, SQLAlchemy, PostgreSQL

### 📊 Módulo 5: Análisis de Datos  
**Puerto: 8892** | **Duración: 4-5 semanas**

- NumPy: Computación numérica
- Pandas: Manipulación de datos
- Matplotlib/Seaborn: Visualización
- Estadística descriptiva
- Limpieza y transformación de datos
- Web scraping
- **Proyecto**: Análisis completo de dataset real

**Tecnologías**: Pandas, NumPy, Matplotlib, Seaborn, Plotly

### 🤖 Módulo 6: Machine Learning
**Puerto: 8893** | **Duración: 5-6 semanas**

- Scikit-learn fundamentals
- Algoritmos supervisados (regresión, clasificación)
- Algoritmos no supervisados (clustering, PCA)
- Validación cruzada y métricas
- Feature engineering
- Ensemble methods
- **Proyecto**: Predictor de precios de viviendas

**Tecnologías**: Scikit-learn, XGBoost, MLflow, Optuna

### 🧠 Módulo 7: Deep Learning
**Puerto: 8894** | **Duración: 6-7 semanas**

- TensorFlow/Keras básico
- PyTorch fundamentals
- Redes neuronales densas
- CNN para imágenes
- RNN/LSTM para secuencias
- Transfer learning
- **Proyecto**: Clasificador de imágenes médicas

**Tecnologías**: TensorFlow, PyTorch, Keras, OpenCV

### 🚀 Módulo 8: Proyectos Avanzados
**Puerto: 8895** | **Duración: 8-10 semanas**

- Integración full-stack
- Microservicios con Python
- Deployment en la nube
- CI/CD pipelines
- Monitoreo y logging
- **Proyecto Final**: Aplicación completa de ML en producción

**Tecnologías**: Docker, Kubernetes, AWS/GCP, GitHub Actions

## 🚀 Instalación y Configuración

### Prerrequisitos

- Docker y Docker Compose instalados
- Git para clonar el repositorio
- Navegador web moderno

### Instalación

```bash
# Clonar el repositorio
git clone <repository-url>
cd python

# Dar permisos de ejecución al script de gestión
chmod +x manage.sh

# Ver ayuda del gestor
./manage.sh help
```

## 📖 Guía de Uso

### Comandos Básicos

```bash
# Listar todos los módulos disponibles
./manage.sh list

# Construir un módulo específico
./manage.sh build fundamentos

# Iniciar un módulo
./manage.sh start fundamentos

# Ver estado de todos los módulos
./manage.sh status

# Detener un módulo
./manage.sh stop fundamentos

# Ver logs de un módulo
./manage.sh logs fundamentos
```

### Flujo de Trabajo Recomendado

1. **Comenzar con Fundamentos**:
   ```bash
   ./manage.sh build fundamentos
   ./manage.sh start fundamentos
   ```
   Accede a: http://localhost:8888

2. **Progresión Secuencial**:
   - Completa cada módulo antes de pasar al siguiente
   - Construye el siguiente módulo mientras trabajas en el actual
   - Usa diferentes puertos para tener múltiples módulos activos

3. **Gestión de Recursos**:
   ```bash
   # Detener módulos no utilizados
   ./manage.sh stop fundamentos
   
   # Limpiar recursos del sistema
   ./manage.sh clean
   ```

## 🎓 Metodología de Aprendizaje

### Enfoque Práctico

Cada módulo sigue la metodología **Learn by Doing**:

1. **Teoría Concisa** (20%): Conceptos esenciales
2. **Ejemplos Prácticos** (40%): Código real y funcional  
3. **Ejercicios Guiados** (30%): Práctica supervisada
4. **Proyecto Final** (10%): Aplicación integral

### Evaluación y Progreso

- ✅ **Checkpoints**: Ejercicios de auto-evaluación
- 🎯 **Proyectos**: Aplicaciones prácticas por módulo
- 📊 **Portfolio**: Construcción de un portafolio profesional
- 🏆 **Certificación**: Proyecto final integrador

### Recursos de Apoyo

- 📚 **Documentación**: Notebooks interactivos con teoría
- 🎥 **Ejemplos**: Código comentado paso a paso
- 🔗 **Referencias**: Enlaces a documentación oficial
- 🤝 **Comunidad**: Espacios para resolver dudas

## 🛠️ Tecnologías y Herramientas

### Por Módulo

| Módulo | Tecnologías Principales | Herramientas Adicionales |
|--------|-------------------------|--------------------------|
| **Fundamentos** | Python 3.11, Jupyter Lab | Black, Pytest, Rich |
| **POO** | Python OOP, UML | Sphinx, Pylint, Graphviz |
| **Algoritmos** | NumPy, NetworkX | Memory Profiler, Numba |
| **Web** | Flask, Django, FastAPI | PostgreSQL, Celery, Redis |
| **Análisis** | Pandas, Matplotlib | Plotly, Seaborn, Streamlit |
| **ML** | Scikit-learn, XGBoost | MLflow, Optuna, SHAP |
| **DL** | TensorFlow, PyTorch | Keras, Transformers, OpenCV |
| **Proyectos** | Full Stack | Docker, AWS, GitHub Actions |

### Ambientes Especializados

Cada módulo tiene un **Dockerfile optimizado**:

- **Base apropiada**: Desde `jupyter/base-notebook` hasta `tensorflow-notebook`
- **Dependencias específicas**: Solo lo necesario para cada módulo
- **Configuración automática**: Jupyter Lab listo para usar
- **Puertos dedicados**: Sin conflictos entre módulos

## 📊 Cronograma Sugerido

### Tiempo Total: ~40-50 semanas (8-10 meses)

```mermaid
gantt
    title Cronograma del Curso de Python
    dateFormat  YYYY-MM-DD
    section Básico
    Fundamentos     :fundamentos, 2025-01-01, 3w
    POO            :poo, after fundamentos, 3w
    section Intermedio  
    Algoritmos     :algoritmos, after poo, 4w
    Web Dev        :web, after algoritmos, 5w
    section Avanzado
    Análisis       :analisis, after web, 5w
    ML             :ml, after analisis, 6w
    Deep Learning  :dl, after ml, 7w
    Proyectos      :proyectos, after dl, 10w
```

### Modalidades de Estudio

1. **Intensivo** (6 meses): 20-25 hrs/semana
2. **Regular** (8 meses): 15-20 hrs/semana  
3. **Pausado** (12 meses): 10-15 hrs/semana

## 🎯 Objetivos de Aprendizaje por Nivel

### 🟢 Nivel Básico (Módulos 1-2)
Al completar este nivel serás capaz de:
- Escribir programas Python funcionales
- Aplicar principios de POO
- Debuggear y testing básico
- Trabajar con archivos y APIs simples

### 🟡 Nivel Intermedio (Módulos 3-4)  
Al completar este nivel serás capaz de:
- Diseñar algoritmos eficientes
- Crear aplicaciones web completas
- Trabajar con bases de datos
- Implementar APIs REST profesionales

### 🔴 Nivel Avanzado (Módulos 5-8)
Al completar este nivel serás capaz de:
- Analizar y visualizar datos complejos
- Construir modelos de Machine Learning
- Implementar redes neuronales
- Desplegar aplicaciones en producción

## 🏆 Proyectos Destacados

### Portfolio Final

Al completar el curso tendrás un **portfolio profesional** con:

1. **🏪 Sistema de E-commerce** (Web + DB)
2. **📈 Dashboard de Analytics** (Análisis de Datos)  
3. **🤖 Chatbot Inteligente** (NLP + ML)
4. **🎯 Predictor de Mercado** (Time Series + DL)
5. **🌐 API Microservices** (Arquitectura distribuida)

### Tecnologías Aplicadas

- **Frontend**: React, Streamlit, Dash
- **Backend**: Django, FastAPI, Flask
- **Datos**: PostgreSQL, MongoDB, Redis
- **ML/DL**: Scikit-learn, TensorFlow, PyTorch
- **Deployment**: Docker, Kubernetes, AWS
- **CI/CD**: GitHub Actions, Testing automatizado

## 🤝 Contribución y Comunidad

### Cómo Contribuir

1. **Fork** el repositorio
2. **Crea** una rama para tu feature
3. **Desarrolla** mejoras o correcciones
4. **Envía** un Pull Request

### Reportar Issues

- 🐛 **Bugs**: Errores en código o configuración
- 📚 **Documentación**: Mejoras en explicaciones
- 💡 **Features**: Nuevas funcionalidades
- 🎓 **Contenido**: Ejercicios o proyectos adicionales

## 📞 Soporte

### Recursos de Ayuda

- 📖 **Wiki**: Documentación detallada
- 💬 **Discussions**: Preguntas y respuestas
- 🎯 **Issues**: Reportes de problemas
- 📧 **Email**: Contacto directo

### FAQ

**P: ¿Necesito experiencia previa?**  
R: No, el curso está diseñado desde cero.

**P: ¿Puedo saltarme módulos?**  
R: Se recomienda seguir el orden, pero es posible.

**P: ¿Cuánto tiempo necesito diariamente?**  
R: Entre 1-3 horas dependiendo de tu objetivo.

**P: ¿Funcionará en Windows/Mac?**  
R: Sí, Docker es multiplataforma.

## 📜 Licencia

Este proyecto está bajo la Licencia MIT. Ver [LICENSE](LICENSE) para más detalles.

## 🙏 Agradecimientos

- **Jupyter Project**: Por el ecosistema de notebooks
- **Docker**: Por la containerización
- **Python Software Foundation**: Por el lenguaje
- **Open Source Community**: Por las librerías utilizadas

---

**¡Inicia tu journey en Python hoy!** 🚀

```bash
./manage.sh start fundamentos
```

¡Nos vemos en http://localhost:8888! 🐍✨
