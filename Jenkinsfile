pipeline {
    agent any

    environment {
        IMAGE_NAME = "grst-app"
        IMAGE_TAG = "latest"
        CONTAINER_NAME = "grst-app-container"
    }

    stages {

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Run Docker Container') {
            steps {
                sh """
                    docker rm -f ${CONTAINER_NAME} || true
                    docker run -d -p 8080:80 --name ${CONTAINER_NAME} ${IMAGE_NAME}:${IMAGE_TAG}
                """
            }
        }
    }
}