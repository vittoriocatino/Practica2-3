// Ejemplo 2: Pipeline con Integración a GitHub
// Este pipeline se conecta a un repositorio de GitHub

pipeline {
    agent any
    
    environment {
        REPO_URL = 'https://github.com/vittoriocatino/Practica2-3.git'
        BRANCH = 'main'
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo '📥 Clonando repositorio desde GitHub...'
                git branch: "${BRANCH}", url: "${REPO_URL}"
                echo '✅ Repositorio clonado exitosamente'
            }
        }
        
        stage('Información del Repositorio') {
            steps {
                echo '📊 Información del repositorio:'
                sh '''
                    echo "Rama actual: $(git branch --show-current)"
                    echo "Último commit: $(git log -1 --pretty=format:'%h - %an: %s')"
                    echo "Total de commits: $(git rev-list --count HEAD)"
                '''
            }
        }
        
        stage('Listar Archivos del Proyecto') {
            steps {
                echo '📂 Estructura del proyecto:'
                sh 'ls -la'
                sh 'echo "---"'
                sh 'find . -type f -name "*.md" | head -10'
            }
        }
        
        stage('Verificar Archivos Importantes') {
            steps {
                echo '🔍 Verificando archivos importantes...'
                script {
                    def files = ['README.md', 'Jenkinsfile', 'Dockerfile']
                    files.each { file ->
                        if (fileExists(file)) {
                            echo "✅ ${file} existe"
                        } else {
                            echo "❌ ${file} no encontrado"
                        }
                    }
                }
            }
        }
        
        stage('Análisis de Código') {
            steps {
                echo '📈 Analizando código...'
                sh '''
                    echo "Archivos .yml: $(find . -name "*.yml" | wc -l)"
                    echo "Archivos .md: $(find . -name "*.md" | wc -l)"
                    echo "Archivos .sh: $(find . -name "*.sh" | wc -l)"
                '''
            }
        }
    }
    
    post {
        success {
            echo '🎉 Pipeline completado exitosamente'
            echo "Build #${env.BUILD_NUMBER} - SUCCESS"
        }
        failure {
            echo '💥 Pipeline falló'
            echo "Build #${env.BUILD_NUMBER} - FAILED"
        }
        always {
            echo '🧹 Limpiando workspace...'
            cleanWs()
        }
    }
}
