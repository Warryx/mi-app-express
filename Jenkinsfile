pipeline {
    agent {
        docker {
            image 'node:18'
        }
    }

    environment {
        NODE_ENV = 'development' // Esta linea cambio porque no estaba node instalado
    }

    stages {
        stage('Checkout') {
            steps {
                echo "📥 Clonando el repositorio..."
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    try {
                        echo "⚙️ Instalando dependencias..."
                        sh 'npm install'
                        echo "🏗️ Ejecutando build..."
                        sh 'npm run build'
                    } catch (Exception e) {
                        error("❌ Error en la etapa de Build")
                    }
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    try {
                        echo "🧪 Ejecutando pruebas..."
                        sh 'npm run test'
                    } catch (Exception e) {
                        error("❌ Error en la etapa de Test")
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    try {
                        echo "🚀 Desplegando aplicación..."
                        sh 'npm start &'
                    } catch (Exception e) {
                        error("❌ Error en la etapa de Deploy")
                    }
                }
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline completado con éxito"
        }
        failure {
            echo "❌ El pipeline ha fallado"
        }
    }
}
