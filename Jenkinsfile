#!groovy
pipeline {
 agent any
 stages {
    stage('Prepare') {
      steps {
        sh 'git checkout https://github.com/argos-research/genode'
        sh 'create builddir'
      }
    }
    stage('Build') {
      steps {
        sh 'echo build'
      }
    }
  } // stages ends here
  post {
    always {
      deleteDir()
    }
  } //post ends here
} // pipeline ends here
    
