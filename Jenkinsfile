pipeline {
  agent none
  stages {
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t thebadalov/nxlog-dockerfile:latest .'
      }
    }
    stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u 'thebadalov' -p 'thebadalov'"
          sh 'docker push thebadalov/nxlog-dockerfile:latest'
        }
      }
    }
  }
}
