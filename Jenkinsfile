pipeline {
    agent any

    checkout scm

    environment {
      DOCKERHUB_CREDS = credentialsId('dockercreds')
    }

    stages {
        stage('Build and tag') {
          container(docker) {
            steps {
                echo 'Hello World'
                sleep 60
                docker --version
                ls -lrt
            }
          }            
        }
    }
}