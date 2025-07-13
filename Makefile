# Makefile para el Curso Modular de Python
# Gestión completa del proyecto con Docker y Jupyter

# Variables de configuración
SHELL := /bin/bash
PROJECT_NAME := python-curso
DOCKER_COMPOSE := docker compose
MANAGE_SCRIPT := ./manage.sh

# Colores para output
GREEN := \033[0;32m
YELLOW := \033[1;33m
BLUE := \033[0;34m
RED := \033[0;31m
NC := \033[0m # No Color

# Módulos disponibles
MODULES := fundamentos poo algoritmos web analisis ml dl proyectos

# Ayuda por defecto
.PHONY: help
help: ## Muestra esta ayuda
	@echo -e "$(BLUE)🐍 Makefile para el Curso Modular de Python$(NC)"
	@echo ""
	@echo -e "$(YELLOW)Comandos disponibles:$(NC)"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  $(GREEN)%-20s$(NC) %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo ""
	@echo -e "$(YELLOW)Módulos disponibles:$(NC)"
	@echo "  fundamentos poo algoritmos web analisis ml dl proyectos"
	@echo ""
	@echo -e "$(YELLOW)Ejemplos de uso:$(NC)"
	@echo "  make setup              # Configuración inicial completa"
	@echo "  make start-fundamentos  # Inicia el módulo de fundamentos"
	@echo "  make clean-all          # Limpia todo el proyecto"
	@echo "  make reset-fundamentos  # Resetea el módulo de fundamentos"

# ==============================================================================
# CONFIGURACIÓN INICIAL
# ==============================================================================

.PHONY: setup
setup: ## Configuración inicial completa del proyecto
	@echo -e "$(BLUE)🚀 Configurando proyecto completo...$(NC)"
	@chmod +x $(MANAGE_SCRIPT)
	@$(MAKE) build-base
	@echo -e "$(GREEN)✅ Proyecto configurado exitosamente$(NC)"

.PHONY: build-base
build-base: ## Construye la imagen base Docker
	@echo -e "$(YELLOW)🔨 Construyendo imagen base...$(NC)"
	@$(MANAGE_SCRIPT) build-base

.PHONY: permissions
permissions: ## Otorga permisos de ejecución al script manage.sh
	@chmod +x $(MANAGE_SCRIPT)
	@echo -e "$(GREEN)✅ Permisos otorgados a manage.sh$(NC)"

# ==============================================================================
# CONSTRUCCIÓN DE MÓDULOS
# ==============================================================================

.PHONY: build-all
build-all: ## Construye todos los módulos
	@echo -e "$(YELLOW)🔨 Construyendo todos los módulos...$(NC)"
	@$(MANAGE_SCRIPT) build-all

# Construcción de módulos individuales
.PHONY: build-fundamentos build-poo build-algoritmos build-web build-analisis build-ml build-dl build-proyectos
build-fundamentos: ## Construye el módulo de fundamentos
	@$(MANAGE_SCRIPT) build fundamentos

build-poo: ## Construye el módulo de POO
	@$(MANAGE_SCRIPT) build poo

build-algoritmos: ## Construye el módulo de algoritmos
	@$(MANAGE_SCRIPT) build algoritmos

build-web: ## Construye el módulo de desarrollo web
	@$(MANAGE_SCRIPT) build web

build-analisis: ## Construye el módulo de análisis de datos
	@$(MANAGE_SCRIPT) build analisis

build-ml: ## Construye el módulo de machine learning
	@$(MANAGE_SCRIPT) build ml

build-dl: ## Construye el módulo de deep learning
	@$(MANAGE_SCRIPT) build dl

build-proyectos: ## Construye el módulo de proyectos avanzados
	@$(MANAGE_SCRIPT) build proyectos

# ==============================================================================
# INICIO Y PARADA DE SERVICIOS
# ==============================================================================

# Inicio de módulos individuales
.PHONY: start-fundamentos start-poo start-algoritmos start-web start-analisis start-ml start-dl start-proyectos
start-fundamentos: ## Inicia el módulo de fundamentos (puerto 8888)
	@$(MANAGE_SCRIPT) start fundamentos

start-poo: ## Inicia el módulo de POO (puerto 8889)
	@$(MANAGE_SCRIPT) start poo

start-algoritmos: ## Inicia el módulo de algoritmos (puerto 8890)
	@$(MANAGE_SCRIPT) start algoritmos

start-web: ## Inicia el módulo de desarrollo web (puerto 8891)
	@$(MANAGE_SCRIPT) start web

start-analisis: ## Inicia el módulo de análisis de datos (puerto 8892)
	@$(MANAGE_SCRIPT) start analisis

start-ml: ## Inicia el módulo de machine learning (puerto 8893)
	@$(MANAGE_SCRIPT) start ml

start-dl: ## Inicia el módulo de deep learning (puerto 8894)
	@$(MANAGE_SCRIPT) start dl

start-proyectos: ## Inicia el módulo de proyectos avanzados (puerto 8895)
	@$(MANAGE_SCRIPT) start proyectos

# Parada de módulos individuales
.PHONY: stop-fundamentos stop-poo stop-algoritmos stop-web stop-analisis stop-ml stop-dl stop-proyectos
stop-fundamentos: ## Detiene el módulo de fundamentos
	@$(MANAGE_SCRIPT) stop fundamentos

stop-poo: ## Detiene el módulo de POO
	@$(MANAGE_SCRIPT) stop poo

stop-algoritmos: ## Detiene el módulo de algoritmos
	@$(MANAGE_SCRIPT) stop algoritmos

stop-web: ## Detiene el módulo de desarrollo web
	@$(MANAGE_SCRIPT) stop web

stop-analisis: ## Detiene el módulo de análisis de datos
	@$(MANAGE_SCRIPT) stop analisis

stop-ml: ## Detiene el módulo de machine learning
	@$(MANAGE_SCRIPT) stop ml

stop-dl: ## Detiene el módulo de deep learning
	@$(MANAGE_SCRIPT) stop dl

stop-proyectos: ## Detiene el módulo de proyectos avanzados
	@$(MANAGE_SCRIPT) stop proyectos

.PHONY: stop-all
stop-all: ## Detiene todos los módulos activos
	@$(MANAGE_SCRIPT) stop-all

# Reinicio de módulos
.PHONY: restart-fundamentos restart-poo restart-algoritmos restart-web restart-analisis restart-ml restart-dl restart-proyectos
restart-fundamentos: ## Reinicia el módulo de fundamentos
	@$(MANAGE_SCRIPT) restart fundamentos

restart-poo: ## Reinicia el módulo de POO
	@$(MANAGE_SCRIPT) restart poo

restart-algoritmos: ## Reinicia el módulo de algoritmos
	@$(MANAGE_SCRIPT) restart algoritmos

restart-web: ## Reinicia el módulo de desarrollo web
	@$(MANAGE_SCRIPT) restart web

restart-analisis: ## Reinicia el módulo de análisis de datos
	@$(MANAGE_SCRIPT) restart analisis

restart-ml: ## Reinicia el módulo de machine learning
	@$(MANAGE_SCRIPT) restart ml

restart-dl: ## Reinicia el módulo de deep learning
	@$(MANAGE_SCRIPT) restart dl

restart-proyectos: ## Reinicia el módulo de proyectos avanzados
	@$(MANAGE_SCRIPT) restart proyectos

# ==============================================================================
# INFORMACIÓN Y MONITOREO
# ==============================================================================

.PHONY: status
status: ## Muestra el estado de todos los módulos
	@$(MANAGE_SCRIPT) status

.PHONY: list
list: ## Lista todos los módulos disponibles
	@$(MANAGE_SCRIPT) list

# Logs de módulos individuales
.PHONY: logs-fundamentos logs-poo logs-algoritmos logs-web logs-analisis logs-ml logs-dl logs-proyectos
logs-fundamentos: ## Muestra logs del módulo de fundamentos
	@$(MANAGE_SCRIPT) logs fundamentos

logs-poo: ## Muestra logs del módulo de POO
	@$(MANAGE_SCRIPT) logs poo

logs-algoritmos: ## Muestra logs del módulo de algoritmos
	@$(MANAGE_SCRIPT) logs algoritmos

logs-web: ## Muestra logs del módulo de desarrollo web
	@$(MANAGE_SCRIPT) logs web

logs-analisis: ## Muestra logs del módulo de análisis de datos
	@$(MANAGE_SCRIPT) logs analisis

logs-ml: ## Muestra logs del módulo de machine learning
	@$(MANAGE_SCRIPT) logs ml

logs-dl: ## Muestra logs del módulo de deep learning
	@$(MANAGE_SCRIPT) logs dl

logs-proyectos: ## Muestra logs del módulo de proyectos avanzados
	@$(MANAGE_SCRIPT) logs proyectos

# ==============================================================================
# LIMPIEZA Y MANTENIMIENTO
# ==============================================================================

.PHONY: clean
clean: ## Limpia contenedores e imágenes Docker no utilizadas
	@$(MANAGE_SCRIPT) clean

.PHONY: clean-outputs-all
clean-outputs-all: ## Limpia outputs de todos los notebooks
	@$(MANAGE_SCRIPT) clean-all-outputs

# Limpieza de outputs de módulos individuales
.PHONY: clean-outputs-fundamentos clean-outputs-poo clean-outputs-algoritmos clean-outputs-web clean-outputs-analisis clean-outputs-ml clean-outputs-dl clean-outputs-proyectos
clean-outputs-fundamentos: ## Limpia outputs del módulo de fundamentos
	@$(MANAGE_SCRIPT) clean-outputs fundamentos

clean-outputs-poo: ## Limpia outputs del módulo de POO
	@$(MANAGE_SCRIPT) clean-outputs poo

clean-outputs-algoritmos: ## Limpia outputs del módulo de algoritmos
	@$(MANAGE_SCRIPT) clean-outputs algoritmos

clean-outputs-web: ## Limpia outputs del módulo de desarrollo web
	@$(MANAGE_SCRIPT) clean-outputs web

clean-outputs-analisis: ## Limpia outputs del módulo de análisis de datos
	@$(MANAGE_SCRIPT) clean-outputs analisis

clean-outputs-ml: ## Limpia outputs del módulo de machine learning
	@$(MANAGE_SCRIPT) clean-outputs ml

clean-outputs-dl: ## Limpia outputs del módulo de deep learning
	@$(MANAGE_SCRIPT) clean-outputs dl

clean-outputs-proyectos: ## Limpia outputs del módulo de proyectos avanzados
	@$(MANAGE_SCRIPT) clean-outputs proyectos

.PHONY: reset-all
reset-all: ## Resetea todos los módulos (detiene, limpia outputs y archivos temporales)
	@$(MANAGE_SCRIPT) reset-all

# Reset de módulos individuales
.PHONY: reset-fundamentos reset-poo reset-algoritmos reset-web reset-analisis reset-ml reset-dl reset-proyectos
reset-fundamentos: ## Resetea el módulo de fundamentos
	@$(MANAGE_SCRIPT) reset fundamentos

reset-poo: ## Resetea el módulo de POO
	@$(MANAGE_SCRIPT) reset poo

reset-algoritmos: ## Resetea el módulo de algoritmos
	@$(MANAGE_SCRIPT) reset algoritmos

reset-web: ## Resetea el módulo de desarrollo web
	@$(MANAGE_SCRIPT) reset web

reset-analisis: ## Resetea el módulo de análisis de datos
	@$(MANAGE_SCRIPT) reset analisis

reset-ml: ## Resetea el módulo de machine learning
	@$(MANAGE_SCRIPT) reset ml

reset-dl: ## Resetea el módulo de deep learning
	@$(MANAGE_SCRIPT) reset dl

reset-proyectos: ## Resetea el módulo de proyectos avanzados
	@$(MANAGE_SCRIPT) reset proyectos

# ==============================================================================
# COMANDOS COMBINADOS Y FLUJOS DE TRABAJO
# ==============================================================================

.PHONY: clean-all
clean-all: ## Limpieza completa del proyecto
	@echo -e "$(BLUE)🧹 Limpieza completa del proyecto...$(NC)"
	@$(MAKE) stop-all
	@$(MAKE) clean-outputs-all
	@$(MAKE) clean
	@echo -e "$(GREEN)✅ Proyecto completamente limpio$(NC)"

.PHONY: prepare-share
prepare-share: ## Prepara el proyecto para compartir (limpia outputs, detiene servicios)
	@echo -e "$(BLUE)📤 Preparando proyecto para compartir...$(NC)"
	@$(MAKE) clean-all
	@echo -e "$(GREEN)✅ Proyecto listo para compartir$(NC)"

.PHONY: dev-start
dev-start: ## Inicia entorno de desarrollo (fundamentos)
	@echo -e "$(BLUE)🚀 Iniciando entorno de desarrollo...$(NC)"
	@$(MAKE) start-fundamentos
	@echo -e "$(GREEN)✅ Entorno listo en http://localhost:8888$(NC)"

.PHONY: full-reset
full-reset: ## Reset completo del proyecto (equivalente a reset-all)
	@echo -e "$(BLUE)🔄 Reset completo del proyecto...$(NC)"
	@$(MAKE) reset-all
	@echo -e "$(GREEN)✅ Proyecto completamente reseteado$(NC)"

# ==============================================================================
# COMANDOS DE DESARROLLO
# ==============================================================================

.PHONY: check-deps
check-deps: ## Verifica dependencias del sistema
	@echo -e "$(BLUE)🔍 Verificando dependencias...$(NC)"
	@command -v docker >/dev/null 2>&1 || { echo -e "$(RED)❌ Docker no está instalado$(NC)"; exit 1; }
	@command -v docker-compose >/dev/null 2>&1 || command -v docker compose >/dev/null 2>&1 || { echo -e "$(RED)❌ Docker Compose no está instalado$(NC)"; exit 1; }
	@echo -e "$(GREEN)✅ Todas las dependencias están instaladas$(NC)"

.PHONY: quick-test
quick-test: ## Test rápido del proyecto (construye base y fundamentos)
	@echo -e "$(BLUE)⚡ Test rápido del proyecto...$(NC)"
	@$(MAKE) build-base
	@$(MAKE) build-fundamentos
	@$(MAKE) start-fundamentos
	@echo -e "$(GREEN)✅ Test completado - http://localhost:8888$(NC)"

# ==============================================================================
# INFORMACIÓN ADICIONAL
# ==============================================================================

.PHONY: ports
ports: ## Muestra los puertos utilizados por cada módulo
	@echo -e "$(BLUE)📡 Puertos utilizados por módulo:$(NC)"
	@echo "  fundamentos: 8888"
	@echo "  poo:         8889"
	@echo "  algoritmos:  8890"
	@echo "  web:         8891"
	@echo "  analisis:    8892"
	@echo "  ml:          8893"
	@echo "  dl:          8894"
	@echo "  proyectos:   8895"

.PHONY: docker-info
docker-info: ## Información sobre contenedores e imágenes Docker
	@echo -e "$(BLUE)🐳 Información de Docker:$(NC)"
	@echo ""
	@echo "Contenedores activos:"
	@docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
	@echo ""
	@echo "Imágenes del proyecto:"
	@docker images | grep -E "(python-|jupyter)" || echo "No hay imágenes del proyecto"

# Regla por defecto
.DEFAULT_GOAL := help
