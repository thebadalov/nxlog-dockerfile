pipeline {
  agent none
  stages {
    stage('Dockerfile build'){
    agent any
    steps{
        sh "docker build . -t thebadalov/nxlog-dockerfile:${env.BUILD_NUMBER}"
      }
    }
    stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh "docker push thebadalov/nxlog-dockerfile:${env.BUILD_NUMBER}"
        }
      }
    }
  }
}
