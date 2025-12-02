# Práctica 2-3: Manejo de Contenedores, Acciones GitHub y Jenkins

**MANEJO DE CONTENEDORES, ACCIONES GITHUB Y JENKINS**

## Objetivo
Practicar el uso de contenedores de Docker, trabajar acciones de Github y familiarizarse con Jenkins.

---

## 📋 Tabla de Integrantes del Equipo

| Nombre | Matrícula | Correo |
|--------|-----------|--------|
| [Tu Nombre] | [Tu Matrícula] | catinovit@gmail.com |
| [Integrante 2] | [Matrícula] | [Correo] |
| [Integrante 3] | [Matrícula] | [Correo] |

> **Nota:** Completa esta tabla con los datos de todos los integrantes del equipo.

---

## 📧 Acción de Notificación por Correo (25pts)

### Descripción
Se ha implementado una acción de GitHub que envía notificaciones por correo electrónico cuando se realizan cambios en el repositorio. Esta acción monitorea tres ramas principales:

- `main` - Rama principal del proyecto
- `feature_a` - Rama de características A
- `feature_b` - Rama de características B

### Funcionamiento

La acción se activa automáticamente cuando se hace un **push** a cualquiera de las tres ramas mencionadas. Al detectar cambios, ejecuta los siguientes pasos:

1. **Checkout del código**: Descarga el código del repositorio
2. **Extracción de información**: Obtiene detalles del commit (autor, mensaje, SHA, rama)
3. **Envío de correo**: Envía un correo electrónico a `catinovit@gmail.com` con:
   - Rama donde se hicieron los cambios
   - Autor del commit
   - Mensaje del commit
   - SHA del commit
   - Enlace directo a los cambios en GitHub

### Configuración de Secrets

Para que la acción funcione correctamente, se configuraron los siguientes **Repository Secrets** en GitHub:

- `EMAIL_USERNAME`: Dirección de correo desde donde se envían las notificaciones
- `EMAIL_PASSWORD`: Contraseña de aplicación de Gmail (App Password)

### Archivo de Configuración

El workflow está definido en `.github/workflows/email-notification.yml` y utiliza:
- **Trigger**: `push` en ramas específicas
- **Action**: `dawidd6/action-send-mail@v3` para envío de correos
- **SMTP**: Gmail (smtp.gmail.com:587)

### Capturas de Evidencia

![Configuración de GitHub Actions](./screenshots/github-actions-config.png)
*Configuración del workflow en GitHub Actions*

![Correo recibido](./screenshots/email-received.png)
*Ejemplo de correo de notificación recibido*

![Ejecución exitosa](./screenshots/action-success.png)
*Ejecución exitosa de la acción en GitHub*

---

## 🔧 Jenkins (15pts)

### ¿Qué es Jenkins?

**Jenkins** es un servidor de automatización open source escrito en Java. Es una de las herramientas más populares para implementar **Integración Continua (CI)** y **Entrega Continua (CD)** en proyectos de software.

### Características Principales

- **Automatización**: Permite automatizar tareas repetitivas del ciclo de desarrollo
- **Extensible**: Cuenta con más de 1,800 plugins para integrarse con prácticamente cualquier herramienta
- **Distribuido**: Puede distribuir trabajo entre múltiples máquinas
- **Open Source**: Gratuito y con una gran comunidad de soporte

### ¿Para qué se utiliza Jenkins?

Jenkins se utiliza principalmente para:

1. **Integración Continua (CI)**
   - Compilar código automáticamente
   - Ejecutar pruebas unitarias
   - Detectar errores tempranamente

2. **Entrega Continua (CD)**
   - Desplegar aplicaciones automáticamente
   - Gestionar releases
   - Automatizar el pipeline de deployment

3. **Automatización de Tareas**
   - Ejecutar scripts programados
   - Generar reportes
   - Notificaciones automáticas

### Tecnología y Arquitectura

Jenkins está construido sobre:
- **Lenguaje**: Java
- **Arquitectura**: Master-Slave (Controller-Agent)
- **Interfaz**: Web-based UI
- **Configuración**: Archivos Groovy (Jenkinsfile)

### Diagrama de Arquitectura Jenkins

```
┌─────────────────────────────────────────────────────────┐
│                    JENKINS MASTER                        │
│  ┌──────────────────────────────────────────────────┐  │
│  │         Jenkins Controller (Servidor)             │  │
│  │  - Gestiona trabajos (Jobs)                       │  │
│  │  - Programa ejecuciones                           │  │
│  │  - Monitorea agentes                              │  │
│  │  - Interfaz web                                   │  │
│  └──────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────┘
                          │
        ┌─────────────────┼─────────────────┐
        │                 │                 │
        ▼                 ▼                 ▼
┌──────────────┐  ┌──────────────┐  ┌──────────────┐
│   Agent 1    │  │   Agent 2    │  │   Agent 3    │
│   (Linux)    │  │  (Windows)   │  │   (Docker)   │
│              │  │              │  │              │
│ - Ejecuta    │  │ - Ejecuta    │  │ - Ejecuta    │
│   builds     │  │   builds     │  │   builds     │
│ - Corre      │  │ - Corre      │  │ - Corre      │
│   tests      │  │   tests      │  │   tests      │
└──────────────┘  └──────────────┘  └──────────────┘
```

### Mapa Mental: Conceptos Clave de Jenkins

```
                        JENKINS
                           │
        ┌──────────────────┼──────────────────┐
        │                  │                  │
    PIPELINE           PLUGINS            BUILDS
        │                  │                  │
   ┌────┴────┐        ┌────┴────┐       ┌────┴────┐
   │         │        │         │       │         │
Stages    Steps    Git      Docker   Success   Failed
   │         │        │         │       │         │
Build    Test    GitHub   Slack   Artifacts  Logs
Deploy   Notify  GitLab   Email   Reports   Retry
```

### Integración con GitHub Actions

Jenkins puede integrarse con GitHub Actions de varias formas:

1. **Webhook Triggers**: GitHub notifica a Jenkins cuando hay cambios
2. **Plugins**: 
   - GitHub Plugin
   - GitHub Branch Source Plugin
   - GitHub Pull Request Builder
3. **Complementariedad**: 
   - GitHub Actions para CI/CD en la nube
   - Jenkins para procesos más complejos on-premise

### Comandos Básicos de Jenkins

```bash
# Iniciar Jenkins (Docker)
docker run -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts

# Acceder a Jenkins
http://localhost:8080

# Obtener contraseña inicial
docker exec <container-id> cat /var/jenkins_home/secrets/initialAdminPassword
```

---

## 🧪 Pruebas Manejo de Jenkins para Tareas (25pts)

### Instalación Local de Jenkins

Para esta práctica, se instaló Jenkins localmente utilizando Docker. A continuación se detallan los pasos:

#### 1. Instalación con Docker

```bash
# Descargar la imagen oficial de Jenkins
docker pull jenkins/jenkins:lts

# Crear un volumen para persistir datos
docker volume create jenkins_home

# Ejecutar Jenkins en un contenedor
docker run -d \
  --name jenkins \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  jenkins/jenkins:lts
```

#### 2. Configuración Inicial

1. **Acceder a Jenkins**: Abrir navegador en `http://localhost:8080`
2. **Obtener contraseña inicial**:
   ```bash
   docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
   ```
3. **Instalar plugins sugeridos**: Seleccionar la opción de plugins recomendados
4. **Crear usuario administrador**: Configurar credenciales de acceso

### Creación de un Job Simple

#### Job 1: Hello World Script

**Tipo**: Freestyle project

**Configuración**:
- **Nombre**: HelloWorld-Job
- **Descripción**: Job de prueba que ejecuta un script simple
- **Build Steps**: Execute shell
  ```bash
  echo "¡Hola desde Jenkins!"
  echo "Fecha y hora: $(date)"
  echo "Usuario: $(whoami)"
  ```

**Resultado**: ✅ Build exitoso

#### Job 2: Compilación de Código

**Tipo**: Pipeline

**Jenkinsfile**:
```groovy
pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                echo 'Descargando código...'
                // git 'https://github.com/vittoriocatino/Practica2-3.git'
            }
        }
        
        stage('Build') {
            steps {
                echo 'Compilando proyecto...'
                sh 'echo "Simulando compilación..."'
            }
        }
        
        stage('Test') {
            steps {
                echo 'Ejecutando pruebas...'
                sh 'echo "Todas las pruebas pasaron ✓"'
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Desplegando aplicación...'
                sh 'echo "Despliegue completado ✓"'
            }
        }
    }
    
    post {
        success {
            echo '¡Pipeline completado exitosamente!'
        }
        failure {
            echo 'El pipeline falló. Revisar logs.'
        }
    }
}
```

#### Job 3: Integración con GitHub

**Configuración**:
- **Source Code Management**: Git
- **Repository URL**: https://github.com/vittoriocatino/Practica2-3
- **Branches to build**: */main
- **Build Triggers**: GitHub hook trigger for GITScm polling

**Build Steps**:
```bash
#!/bin/bash
echo "=== Información del Repositorio ==="
git log -1 --pretty=format:"Último commit: %h - %an - %s"
echo ""
echo "=== Archivos en el repositorio ==="
ls -la
```

### Capturas de Evidencia Jenkins

![Panel de Jenkins](./screenshots/jenkins-dashboard.png)
*Panel principal de Jenkins mostrando los jobs configurados*

![Ejecución de Job](./screenshots/jenkins-job-execution.png)
*Ejecución exitosa de un job en Jenkins*

![Console Output](./screenshots/jenkins-console-output.png)
*Salida de consola mostrando los logs de ejecución*

![Pipeline Stages](./screenshots/jenkins-pipeline-stages.png)
*Visualización de las etapas del pipeline*

### Aprendizajes Clave

1. **Interfaz Intuitiva**: Jenkins tiene una interfaz web fácil de usar
2. **Flexibilidad**: Permite crear desde jobs simples hasta pipelines complejos
3. **Automatización**: Reduce significativamente el trabajo manual
4. **Integración**: Se conecta fácilmente con GitHub y otras herramientas
5. **Monitoreo**: Proporciona logs detallados y notificaciones

---

## 🎥 Video de Evidencia (30pts)

### Parte 1: Push al Repositorio y Notificación por Correo

En esta primera parte del video se muestra:

1. **Preparación del entorno**
   - Apertura de terminal
   - Navegación al directorio del proyecto
   - Verificación del estado de Git

2. **Creación de cambios**
   - Modificación de archivos
   - Uso de `git status` para ver cambios
   - Staging de archivos con `git add`

3. **Commit y Push**
   - Creación de commit con mensaje descriptivo
   - Push a las ramas: main, feature_a, feature_b
   - Verificación en GitHub

4. **Recepción de correo**
   - Apertura de bandeja de entrada
   - Visualización del correo recibido
   - Verificación de la información del commit

### Parte 2: Jenkins - Interfaz y Ejecución de Tareas

En esta segunda parte del video se muestra:

1. **Inicio de Jenkins**
   - Ejecución del contenedor Docker
   - Acceso a la interfaz web (localhost:8080)
   - Login al sistema

2. **Navegación por la interfaz**
   - Panel principal (Dashboard)
   - Exploración de jobs existentes
   - Configuración de un nuevo job

3. **Ejecución de tareas**
   - Inicio manual de un job
   - Visualización del progreso en tiempo real
   - Revisión de console output
   - Verificación de resultados

4. **Demostración de funcionalidades**
   - Ejecución de pipeline
   - Visualización de stages
   - Revisión de logs y artifacts
   - Configuración de triggers

### Enlaces al Video

📹 **Video completo**: [Enlace a YouTube - Subir aquí tu video]

📹 **Parte 1 - GitHub Actions**: [Timestamp o enlace específico]

📹 **Parte 2 - Jenkins**: [Timestamp o enlace específico]

> **Nota**: El video debe ser subido a YouTube como video oculto y agregar la URL al reporte.

---

## 📝 Conclusiones (5pts)

### Conclusiones Individuales

**[Tu Nombre]:**
Esta práctica me permitió comprender la importancia de la automatización en el desarrollo de software moderno. Lo más difícil fue configurar correctamente los secrets de GitHub para el envío de correos, pero una vez resuelto, el sistema funcionó perfectamente. GitHub Actions demostró ser una herramienta poderosa y accesible para CI/CD. Jenkins, aunque más complejo, ofrece mayor flexibilidad para proyectos empresariales. En mi vida profesional, definitivamente utilizaría estas herramientas para automatizar pruebas y despliegues, ahorrando tiempo y reduciendo errores humanos.

**[Integrante 2]:**
[Escribe aquí tus conclusiones personales sobre la práctica]

**[Integrante 3]:**
[Escribe aquí tus conclusiones personales sobre la práctica]

### Conclusión General del Equipo

La práctica nos enseñó que la automatización es fundamental en el desarrollo moderno. GitHub Actions y Jenkins son herramientas complementarias: mientras GitHub Actions es ideal para proyectos en la nube con configuración simple, Jenkins brilla en entornos empresariales que requieren mayor control y personalización. La combinación de ambas tecnologías con Docker crea un ecosistema robusto para CI/CD que cualquier equipo de desarrollo debería considerar implementar.

---

## 😄 Chiste (5pts)

**¿Por qué los programadores prefieren el modo oscuro?**

Porque la luz atrae a los bugs! 🐛💡

---

**Miembro del equipo que más risa le dio el chiste**: [Nombre] - ¡5pts extra! 🎉

---

## 📚 Referencias

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Jenkins Official Documentation](https://www.jenkins.io/doc/)
- [Docker Documentation](https://docs.docker.com/)
- [Send Email GitHub Action](https://github.com/dawidd6/action-send-mail)
- [Jenkins Pipeline Syntax](https://www.jenkins.io/doc/book/pipeline/syntax/)

---

## 📂 Estructura del Proyecto

```
practica2-3/
├── .github/
│   └── workflows/
│       └── email-notification.yml    # Workflow de notificación por correo
├── screenshots/                       # Capturas de pantalla de evidencia
│   ├── github-actions-config.png
│   ├── email-received.png
│   ├── action-success.png
│   ├── jenkins-dashboard.png
│   ├── jenkins-job-execution.png
│   ├── jenkins-console-output.png
│   └── jenkins-pipeline-stages.png
├── Jenkinsfile                        # Configuración de pipeline de Jenkins
├── Dockerfile                         # Dockerfile para contenedores
└── README.md                          # Este archivo
```

---

## 🚀 Cómo Usar Este Proyecto

### Configurar GitHub Actions

1. Fork o clona este repositorio
2. Ve a Settings → Secrets and variables → Actions
3. Agrega los siguientes secrets:
   - `EMAIL_USERNAME`: Tu correo de Gmail
   - `EMAIL_PASSWORD`: App Password de Gmail
4. Crea las ramas `feature_a` y `feature_b`
5. Haz push a cualquier rama para probar

### Ejecutar Jenkins Localmente

```bash
# Clonar el repositorio
git clone https://github.com/vittoriocatino/Practica2-3.git
cd Practica2-3

# Iniciar Jenkins con Docker
docker run -d -p 8080:8080 -p 50000:50000 --name jenkins jenkins/jenkins:lts

# Obtener contraseña inicial
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword

# Acceder a Jenkins
# Abrir navegador en http://localhost:8080
```

---

**Fecha de entrega**: [Fecha]

**Calificación obtenida**: _____ / 100 pts

---

*Práctica realizada para el curso de Tecnologías de Integración de Código*
