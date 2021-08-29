pipeline {
    agent any

    checkout scm

    environment {
      DOCKERHUB_CREDS = credentialsId('dockercreds')
    }

    stages {
        stage('Build and tag') {
          steps {
            sh "docker --version"
            sh "kubectl version"
          }
           
        }
    }
}