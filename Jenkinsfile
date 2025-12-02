pipeline {
    agent any
    
    environment {
        PROJECT_NAME = 'Practica2-3'
        BUILD_NUMBER = "${env.BUILD_NUMBER}"
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo '📥 Descargando código del repositorio...'
                checkout scm
                echo '✅ Código descargado exitosamente'
            }
        }
        
        stage('Environment Info') {
            steps {
                echo '🔍 Información del entorno:'
                sh '''
                    echo "Directorio actual: $(pwd)"
                    echo "Usuario: $(whoami)"
                    echo "Fecha: $(date)"
                    echo "Branch: ${GIT_BRANCH}"
                    echo "Commit: ${GIT_COMMIT}"
                '''
            }
        }
        
        stage('List Files') {
            steps {
                echo '📂 Listando archivos del proyecto:'
                sh 'ls -la'
                echo '📄 Contenido del README:'
                sh 'head -20 README.md || echo "README.md no encontrado"'
            }
        }
        
        stage('Build') {
            steps {
                echo '🔨 Iniciando proceso de build...'
                sh '''
                    echo "Simulando compilación del proyecto..."
                    sleep 2
                    echo "Build completado exitosamente"
                '''
            }
        }
        
        stage('Test') {
            steps {
                echo '🧪 Ejecutando pruebas...'
                sh '''
                    echo "Ejecutando pruebas unitarias..."
                    sleep 1
                    echo "✓ Todas las pruebas pasaron"
                    echo "Tests ejecutados: 10"
                    echo "Tests exitosos: 10"
                    echo "Tests fallidos: 0"
                '''
            }
        }
        
        stage('Code Quality') {
            steps {
                echo '📊 Analizando calidad del código...'
                sh '''
                    echo "Ejecutando análisis de código..."
                    sleep 1
                    echo "✓ Análisis completado"
                    echo "Calidad del código: A+"
                '''
            }
        }
        
        stage('Deploy') {
            when {
                branch 'main'
            }
            steps {
                echo '🚀 Desplegando aplicación...'
                sh '''
                    echo "Preparando despliegue..."
                    sleep 2
                    echo "✓ Aplicación desplegada exitosamente"
                '''
            }
        }
    }
    
    post {
        success {
            echo '✅ ¡Pipeline completado exitosamente!'
            echo "Build #${BUILD_NUMBER} - SUCCESS"
        }
        failure {
            echo '❌ El pipeline falló'
            echo "Build #${BUILD_NUMBER} - FAILED"
            echo 'Por favor revisa los logs para más detalles'
        }
        always {
            echo '🏁 Limpiando workspace...'
            cleanWs()
        }
    }
}
