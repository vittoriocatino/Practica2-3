#!/bin/bash

# Script para configurar Jenkins con Docker
# Automatiza la instalación y configuración inicial

echo "🔧 Script de Configuración de Jenkins"
echo "======================================"
echo ""

# Colores
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Verificar si Docker está instalado
if ! command -v docker &> /dev/null; then
    echo -e "${RED}❌ Docker no está instalado${NC}"
    echo "Por favor instala Docker primero: https://docs.docker.com/get-docker/"
    exit 1
fi

echo -e "${GREEN}✅ Docker está instalado${NC}"
echo ""

# Verificar si el contenedor ya existe
if docker ps -a | grep -q jenkins; then
    echo -e "${YELLOW}⚠️  Ya existe un contenedor llamado 'jenkins'${NC}"
    read -p "¿Deseas eliminarlo y crear uno nuevo? (s/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Ss]$ ]]; then
        echo "Deteniendo y eliminando contenedor existente..."
        docker stop jenkins 2>/dev/null
        docker rm jenkins 2>/dev/null
        echo -e "${GREEN}✅ Contenedor eliminado${NC}"
    else
        echo "Saliendo..."
        exit 0
    fi
fi

echo -e "${BLUE}📦 Descargando imagen de Jenkins...${NC}"
docker pull jenkins/jenkins:lts

echo ""
echo -e "${BLUE}📁 Creando volumen para persistir datos...${NC}"
docker volume create jenkins_home

echo ""
echo -e "${BLUE}🚀 Iniciando Jenkins...${NC}"
docker run -d \
  --name jenkins \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  jenkins/jenkins:lts

echo ""
echo -e "${GREEN}✅ Jenkins iniciado correctamente${NC}"
echo ""

# Esperar a que Jenkins inicie
echo "⏳ Esperando a que Jenkins inicie (esto puede tomar 30-60 segundos)..."
sleep 30

# Obtener la contraseña inicial
echo ""
echo -e "${BLUE}🔑 Contraseña inicial de Jenkins:${NC}"
echo "=================================================="
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
echo "=================================================="
echo ""

echo -e "${GREEN}🎉 ¡Configuración completada!${NC}"
echo ""
echo "📋 Próximos pasos:"
echo "1. Abre tu navegador en: ${BLUE}http://localhost:8080${NC}"
echo "2. Copia la contraseña mostrada arriba"
echo "3. Pégala en la página de Jenkins"
echo "4. Selecciona 'Install suggested plugins'"
echo "5. Crea tu usuario administrador"
echo ""
echo "📚 Para más información, consulta SETUP.md"
echo ""

# Comandos útiles
echo "💡 Comandos útiles:"
echo "  Ver logs:        docker logs jenkins"
echo "  Detener Jenkins: docker stop jenkins"
echo "  Iniciar Jenkins: docker start jenkins"
echo "  Eliminar todo:   docker stop jenkins && docker rm jenkins && docker volume rm jenkins_home"
echo ""
