#!/bin/bash

# Script para generar instrucciones de AI en cualquier proyecto
# Uso: ./generate-ai-instructions.sh

echo "🤖 Generador de Instrucciones para Agentes de IA"
echo ""

# Crear directorio .github si no existe
mkdir -p .github

# Detectar tipo de proyecto
PROJECT_TYPE="unknown"
MAIN_TECH="unknown"
COMMANDS=""

if [ -f "package.json" ]; then
    PROJECT_TYPE="Node.js"
    MAIN_TECH="JavaScript/TypeScript"
    COMMANDS="npm install, npm start, npm test"
elif [ -f "requirements.txt" ] || [ -f "pyproject.toml" ]; then
    PROJECT_TYPE="Python"
    MAIN_TECH="Python"
    COMMANDS="pip install, python main.py"
elif [ -f "Cargo.toml" ]; then
    PROJECT_TYPE="Rust"
    MAIN_TECH="Rust"
    COMMANDS="cargo build, cargo run"
elif [ -f "docker-compose.yml" ]; then
    PROJECT_TYPE="Docker"
    MAIN_TECH="Docker/Containers"
    COMMANDS="docker-compose up, make commands"
fi

echo "📋 Proyecto detectado: $PROJECT_TYPE"
echo "🔧 Tecnología: $MAIN_TECH"
echo ""

# Generar archivo básico
cat > .github/copilot-instructions.md << EOF
# Instrucciones para Agentes de IA - Proyecto $PROJECT_TYPE

## 🚨 **CONTEXTO CRÍTICO - LEE ESTO PRIMERO**

### **Ubicación y Ambiente**
- **Directorio de trabajo**: \`$(pwd)\`
- **Tipo de proyecto**: $PROJECT_TYPE
- **Stack principal**: $MAIN_TECH
- **Idioma**: **SIEMPRE responder en ESPAÑOL**

### **Comandos principales detectados**
$COMMANDS

## 🎯 **REGLAS DE ORO PARA AGENTES**

### **SIEMPRE hacer esto ANTES de responder:**
1. **Responder en ESPAÑOL** - el usuario es hispanohablante
2. Verificar el contexto del proyecto ($PROJECT_TYPE)
3. Usar los comandos apropiados para $MAIN_TECH

### **NUNCA sugerir:**
- Comandos incompatibles con $PROJECT_TYPE
- **Responder en inglés** (solo español)

### **Respuestas típicas que debes dar:**
- **Todas las respuestas en español, con explicaciones claras y comandos específicos**
EOF

echo "✅ Archivo generado: .github/copilot-instructions.md"
echo ""
echo "📝 Próximos pasos:"
echo "1. Revisa y personaliza el archivo generado"
echo "2. Agrega comandos específicos de tu proyecto"
echo "3. Define patrones y anti-patrones específicos"
echo ""
echo "🔗 Archivo creado en: .github/copilot-instructions.md"
