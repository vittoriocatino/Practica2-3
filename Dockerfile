# Dockerfile para la Práctica 2-3
# Imagen base de Node.js (puedes cambiar según tu proyecto)
FROM node:18-alpine

# Información del mantenedor
LABEL maintainer="catinovit@gmail.com"
LABEL description="Contenedor para Práctica 2-3 - GitHub Actions y Jenkins"

# Establecer directorio de trabajo
WORKDIR /app

# Copiar archivos del proyecto
COPY . .

# Instalar dependencias si existen
RUN if [ -f "package.json" ]; then npm install; fi

# Exponer puerto (ajustar según necesidad)
EXPOSE 3000

# Comando por defecto
CMD ["echo", "Contenedor de Práctica 2-3 ejecutándose correctamente"]
