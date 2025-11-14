pipeline {
  agent any
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t your-dockerhub/frontend:latest .'
      }
    }
    stage('Push') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh 'echo $PASSWORD | docker login -u $USERNAME --password-stdin'
          sh 'docker push your-dockerhub/frontend:latest'
        }
      }
    }
    stage('Deploy') {
      steps {
        sh 'helm upgrade --install learner-report ./helm-chart --values ./helm-chart/values.yaml'
      }
    }
  }
}