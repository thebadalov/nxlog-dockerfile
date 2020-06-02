pipeline {
  agent none
  stages {
    stage('Docker Tag') {
      agent any
      steps {
        sh "docker tag nxlog-ce thebadalov/nxlog-dockerfile:${env.BUILD_NUMBER}"
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
