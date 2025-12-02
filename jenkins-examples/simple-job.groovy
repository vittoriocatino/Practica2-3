// Ejemplo 1: Job Simple de Jenkins
// Este script puede ser usado en un Pipeline Job

pipeline {
    agent any
    
    stages {
        stage('Hello World') {
            steps {
                echo '¡Hola desde Jenkins!'
                echo "Build número: ${env.BUILD_NUMBER}"
                echo "Job: ${env.JOB_NAME}"
            }
        }
        
        stage('Información del Sistema') {
            steps {
                sh 'echo "Usuario: $(whoami)"'
                sh 'echo "Fecha: $(date)"'
                sh 'echo "Directorio: $(pwd)"'
            }
        }
        
        stage('Listar Archivos') {
            steps {
                sh 'ls -la'
            }
        }
    }
    
    post {
        success {
            echo '✅ Job completado exitosamente'
        }
        failure {
            echo '❌ Job falló'
        }
    }
}
