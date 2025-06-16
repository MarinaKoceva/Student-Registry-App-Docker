pipeline {
    agent any

    environment {
        DOCKERHUB_USERNAME = 'marina1478'
        DOCKER_IMAGE = "${DOCKERHUB_USERNAME}/student-registry"
        TAG = 'latest'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/MarinaKoceva/Student-Registry-App-Docker.git'
            }
        }

        stage('Install dependencies') {
            steps {
                bat 'npm install'
            }
        }

        stage('Run tests') {
            steps {
                bat 'npm test'
            }
        }

        stage('Build Docker image') {
            steps {
                bat "docker build -t %DOCKER_IMAGE%:%TAG% ."
            }
        }

        stage('Push Docker image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'DOCKER_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    bat "echo %DOCKER_PASSWORD% | docker login -u %DOCKERHUB_USERNAME% --password-stdin"
                    bat "docker push %DOCKER_IMAGE%:%TAG%"
                }
            }
        }

        stage('Deploy') {
            steps {
                bat 'docker-compose -f docker-compose.yml up -d'
            }
        }
    }
}
