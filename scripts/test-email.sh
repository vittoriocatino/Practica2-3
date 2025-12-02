#!/bin/bash

# Script para probar el envío de correos desde GitHub Actions
# Este script simula cambios y hace push a las diferentes ramas

echo "🚀 Script de prueba para notificaciones por correo"
echo "=================================================="
echo ""

# Colores para output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Función para hacer cambios y push
test_branch() {
    local branch=$1
    echo -e "${BLUE}📝 Probando rama: $branch${NC}"
    
    # Cambiar a la rama
    git checkout $branch
    
    # Crear un cambio
    echo "Test ejecutado en $(date)" >> test-log.txt
    
    # Commit y push
    git add test-log.txt
    git commit -m "Test de notificación por correo - rama $branch"
    git push origin $branch
    
    echo -e "${GREEN}✅ Push completado a $branch${NC}"
    echo ""
    sleep 2
}

# Verificar que estamos en un repositorio Git
if [ ! -d .git ]; then
    echo -e "${YELLOW}⚠️  No estás en un repositorio Git${NC}"
    exit 1
fi

echo "Probando notificaciones en las 3 ramas..."
echo ""

# Probar cada rama
test_branch "main"
test_branch "feature_a"
test_branch "feature_b"

echo -e "${GREEN}🎉 ¡Pruebas completadas!${NC}"
echo "Revisa tu correo (catinovit@gmail.com) para ver las notificaciones"
echo ""
echo "También puedes verificar en GitHub Actions:"
echo "https://github.com/vittoriocatino/Practica2-3/actions"
