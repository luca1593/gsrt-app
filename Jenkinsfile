pipeline {
    agent any

    environment {
        IMAGE_NAME = "grst-app-pre-prod"
        IMAGE_TAG = "pre-prod"
        CONTAINER_NAME = "grst-app-pre-prod"
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
                    docker run -d -p 8091:83 --name ${CONTAINER_NAME} ${IMAGE_NAME}:${IMAGE_TAG}
                """
            }
        }
    }
}