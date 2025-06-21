#!/bin/bash
set -e

# Verificar y arreglar permisos si es necesario
fix_permissions() {
  local path="$1"
  if [ -e "$path" ]; then
    echo "Verificando permisos para $path"
    # Si el directorio no pertenece al usuario jupyter, arreglar permisos
    if [ "$(stat -c '%u' "$path")" != "$(id -u)" ]; then
      echo "Corrigiendo permisos para $path"
      find "$path" -type d -exec chmod 755 {} \;
      find "$path" -type f -exec chmod 644 {} \;
    fi
  fi
}

# Verificar directorios de trabajo
fix_permissions /home/jupyter/work
fix_permissions /home/jupyter/data

# Asegurar que las extensiones de Jupyter estén actualizadas
jupyter lab build --dev-build=False --minimize=True

echo "Ambiente de Jupyter configurado correctamente"
echo "Iniciando: $@"

exec "$@"
