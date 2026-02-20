pipeline {
    agent any

    environment {
        IMAGE_NAME = "grst-app"
        IMAGE_TAG = "latest"
        CONTAINER_NAME = "grst-app-container"
    }

    stages {

        stage('Checkout Code') {
            steps {
                echo 'Code checkout complete.'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm ci'
            }
        }

        stage('Build Angular App') {
            steps {
                sh 'npm run build -- --configuration=development'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'npm run test -- --watch=false --browsers=ChromeHeadless'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh """
                        docker rm -f ${CONTAINER_NAME} || true
                        docker run -d \
                          -p 8089:8089 \
                          --name ${CONTAINER_NAME} \
                          ${IMAGE_NAME}:${IMAGE_TAG}
                    """
                }
            }
        }
    }

    post {
        success {
            echo '✅ Application Angular lancée dans Docker sur http://localhost:8089'
        }
        failure {
            echo '❌ Le build a échoué.'
        }
    }
}