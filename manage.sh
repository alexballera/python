#!/bin/bash

# Script de gestión para el curso modular de Python
# Uso: ./manage.sh [comando] [modulo]

set -e

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Función para mostrar ayuda
show_help() {
    echo -e "${BLUE}🐍 Gestor del Curso Modular de Python${NC}"
    echo ""
    echo "Uso: $0 [comando] [modulo]"
    echo ""
    echo -e "${YELLOW}Comandos disponibles:${NC}"
    echo "  help                    - Muestra esta ayuda"
    echo "  list                    - Lista todos los módulos disponibles"
    echo "  build-base              - Construye la imagen base (requerido antes del primer build)"
    echo "  build [modulo]          - Construye un módulo específico"
    echo "  build-all               - Construye todos los módulos"
    echo "  start [modulo]          - Inicia un módulo específico"
    echo "  stop [modulo]           - Detiene un módulo específico"
    echo "  restart [modulo]        - Reinicia un módulo específico"
    echo "  stop-all                - Detiene todos los módulos"
    echo "  clean                   - Limpia contenedores e imágenes no utilizadas"
    echo "  status                  - Muestra el estado de todos los módulos"
    echo "  logs [modulo]           - Muestra los logs de un módulo"
    echo ""
    echo -e "${YELLOW}Módulos disponibles:${NC}"
    echo "  fundamentos             - Módulo 1: Fundamentos de Python (puerto 8888)"
    echo "  poo                     - Módulo 2: Programación Orientada a Objetos (puerto 8889)"
    echo "  algoritmos              - Módulo 3: Algoritmos y Estructuras de Datos (puerto 8890)"
    echo "  web                     - Módulo 4: Desarrollo Web (puerto 8891)"
    echo "  analisis                - Módulo 5: Análisis de Datos (puerto 8892)"
    echo "  ml                      - Módulo 6: Machine Learning (puerto 8893)"
    echo "  dl                      - Módulo 7: Deep Learning (puerto 8894)"
    echo "  proyectos               - Módulo 8: Proyectos Avanzados (puerto 8895)"
    echo ""
    echo -e "${YELLOW}Ejemplos:${NC}"
    echo "  $0 build-base           - Construye la imagen base (necesario antes del primer build)"
    echo "  $0 start fundamentos    - Inicia el módulo de fundamentos"
    echo "  $0 build ml             - Construye el módulo de machine learning"
    echo "  $0 status               - Muestra todos los contenedores activos"
}

# Función para listar módulos
list_modules() {
    echo -e "${BLUE}📚 Módulos del Curso de Python:${NC}"
    echo ""
    echo "1. 🐍 fundamentos    - Fundamentos de Python"
    echo "2. 🏗️  poo           - Programación Orientada a Objetos"
    echo "3. 🧮 algoritmos     - Algoritmos y Estructuras de Datos"
    echo "4. 🌐 web            - Desarrollo Web"
    echo "5. 📊 analisis       - Análisis de Datos"
    echo "6. 🤖 ml             - Machine Learning"
    echo "7. 🧠 dl             - Deep Learning"
    echo "8. 🚀 proyectos      - Proyectos Avanzados"
}

# Función para validar si un módulo existe
validate_module() {
    local module=$1
    local valid_modules=("fundamentos" "poo" "algoritmos" "web" "analisis" "ml" "dl" "proyectos")
    
    for valid_module in "${valid_modules[@]}"; do
        if [[ $module == $valid_module ]]; then
            return 0
        fi
    done
    
    echo -e "${RED}❌ Error: Módulo '$module' no válido${NC}"
    echo "Usa '$0 list' para ver los módulos disponibles"
    return 1
}

# Función para mapear nombre del módulo a directorio
get_module_path() {
    local module=$1
    case $module in
        fundamentos) echo "01_fundamentos" ;;
        poo) echo "02_poo" ;;
        algoritmos) echo "03_algoritmos" ;;
        web) echo "04_web" ;;
        analisis) echo "05_analisis_datos" ;;
        ml) echo "06_machine_learning" ;;
        dl) echo "07_deep_learning" ;;
        proyectos) echo "08_proyectos" ;;
    esac
}

# Función para construir la imagen base
build_base() {
    echo -e "${YELLOW}🔨 Construyendo imagen base python-base...${NC}"
    
    if [ ! -f "docker/Dockerfile.base" ]; then
        echo -e "${RED}❌ Error: Archivo docker/Dockerfile.base no encontrado${NC}"
        return 1
    fi
    
    docker build -t python-base:latest -f docker/Dockerfile.base docker/
    echo -e "${GREEN}✅ Imagen base python-base construida exitosamente${NC}"
}

# Función para construir un módulo
build_module() {
    local module=$1
    local module_path=$(get_module_path $module)
    
    if ! validate_module $module; then
        return 1
    fi
    
    # Verificar si la imagen base existe
    if ! docker image inspect python-base:latest &>/dev/null; then
        echo -e "${RED}❌ Error: La imagen base 'python-base:latest' no existe${NC}"
        echo -e "${YELLOW}💡 Ejecuta primero: $0 build-base${NC}"
        return 1
    fi
    
    echo -e "${YELLOW}🔨 Construyendo módulo: $module${NC}"
    
    if [ ! -d "modulos/$module_path" ]; then
        echo -e "${RED}❌ Error: Directorio modulos/$module_path no encontrado${NC}"
        return 1
    fi
    
    docker compose build $module
    echo -e "${GREEN}✅ Módulo $module construido exitosamente${NC}"
}

# Función para construir todos los módulos
build_all() {
    echo -e "${YELLOW}🔨 Construyendo todos los módulos...${NC}"
    docker compose build
    echo -e "${GREEN}✅ Todos los módulos construidos exitosamente${NC}"
}

# Función para iniciar un módulo
start_module() {
    local module=$1
    
    if ! validate_module $module; then
        return 1
    fi
    
    echo -e "${YELLOW}🚀 Iniciando módulo: $module${NC}"
    docker compose --profile $module up -d
    
    # Obtener puerto del módulo
    local port
    case $module in
        fundamentos) port=8888 ;;
        poo) port=8889 ;;
        algoritmos) port=8890 ;;
        web) port=8891 ;;
        analisis) port=8892 ;;
        ml) port=8893 ;;
        dl) port=8894 ;;
        proyectos) port=8895 ;;
    esac
    
    echo -e "${GREEN}✅ Módulo $module iniciado${NC}"
    echo -e "${BLUE}🌐 Accede a: http://localhost:$port${NC}"
}

# Función para detener un módulo
stop_module() {
    local module=$1
    
    if ! validate_module $module; then
        return 1
    fi
    
    echo -e "${YELLOW}⏹️  Deteniendo módulo: $module${NC}"
    docker compose --profile $module down
    echo -e "${GREEN}✅ Módulo $module detenido${NC}"
}

# Función para reiniciar un módulo
restart_module() {
    local module=$1
    
    if ! validate_module $module; then
        return 1
    fi
    
    echo -e "${YELLOW}🔄 Reiniciando módulo: $module${NC}"
    stop_module $module
    start_module $module
}

# Función para detener todos los módulos
stop_all() {
    echo -e "${YELLOW}⏹️  Deteniendo todos los módulos...${NC}"
    docker compose down
    echo -e "${GREEN}✅ Todos los módulos detenidos${NC}"
}

# Función para mostrar estado
show_status() {
    echo -e "${BLUE}📊 Estado de los módulos:${NC}"
    echo ""
    docker compose ps
}

# Función para mostrar logs
show_logs() {
    local module=$1
    
    if ! validate_module $module; then
        return 1
    fi
    
    echo -e "${YELLOW}📋 Logs del módulo: $module${NC}"
    docker compose --profile $module logs -f
}

# Función para limpiar
clean() {
    echo -e "${YELLOW}🧹 Limpiando contenedores e imágenes no utilizadas...${NC}"
    docker system prune -f
    echo -e "${GREEN}✅ Limpieza completada${NC}"
}

# Procesamiento de argumentos
case "${1:-help}" in
    help)
        show_help
        ;;
    list)
        list_modules
        ;;
    build-base)
        build_base
        ;;
    build)
        if [ -z "$2" ]; then
            echo -e "${RED}❌ Error: Especifica un módulo para construir${NC}"
            echo "Usa '$0 list' para ver los módulos disponibles"
            exit 1
        fi
        build_module "$2"
        ;;
    build-all)
        build_all
        ;;
    start)
        if [ -z "$2" ]; then
            echo -e "${RED}❌ Error: Especifica un módulo para iniciar${NC}"
            echo "Usa '$0 list' para ver los módulos disponibles"
            exit 1
        fi
        start_module "$2"
        ;;
    stop)
        if [ -z "$2" ]; then
            echo -e "${RED}❌ Error: Especifica un módulo para detener${NC}"
            echo "Usa '$0 list' para ver los módulos disponibles"
            exit 1
        fi
        stop_module "$2"
        ;;
    restart)
        if [ -z "$2" ]; then
            echo -e "${RED}❌ Error: Especifica un módulo para reiniciar${NC}"
            echo "Usa '$0 list' para ver los módulos disponibles"
            exit 1
        fi
        restart_module "$2"
        ;;
    stop-all)
        stop_all
        ;;
    status)
        show_status
        ;;
    logs)
        if [ -z "$2" ]; then
            echo -e "${RED}❌ Error: Especifica un módulo para ver logs${NC}"
            echo "Usa '$0 list' para ver los módulos disponibles"
            exit 1
        fi
        show_logs "$2"
        ;;
    clean)
        clean
        ;;
    *)
        echo -e "${RED}❌ Error: Comando '$1' no reconocido${NC}"
        echo ""
        show_help
        exit 1
        ;;
esac
