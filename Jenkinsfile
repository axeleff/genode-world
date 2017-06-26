#!groovy
pipeline {
 agent any
 stages {
    stage('Prepare') {
      steps {
        //preparing for github log
        sh "mkdir -p log"
        sh "touch log/prepare.log"
        sh 'git clone https://github.com/argos-research/genode > log/prepare.log.txt 2>&1'
        sh 'create builddir >> log/prepare.log.txt 2>&1'
      }
    }
    stage('Build') {
      steps {
        sh 'echo build'
      }
    }
  
  } // stages ends here
  post {
   failure {
    mattermostSend color: "#E01818", message: "Build Failed: [${env.JOB_NAME} ${env.BUILD_NUMBER}](${env.BUILD_URL}) ; See more log information here: https://nextcloud.os.in.tum.de/apps/files/?dir=/702nados/log/${env.JOB_NAME}/${env.BUILD_NUMBER}/"
   }
   success {
    mattermostSend color: "#3cc435", message: "Build Successful: [${env.JOB_NAME} ${env.BUILD_NUMBER}](${env.BUILD_URL}) ; See more log information here: https://nextcloud.os.in.tum.de/apps/files/?dir=/702nados/log/${env.JOB_NAME}/${env.BUILD_NUMBER}/"
}
    always {
        sh "mkdir -p /home/bliening/ownCloud/702nados/log/${env.JOB_NAME}/${env.BUILD_NUMBER}"
        sh "cp -R log/* /home/bliening/ownCloud/702nados/log/${env.JOB_NAME}/${env.BUILD_NUMBER}/"
      deleteDir()
    }
  } //post ends here
} // pipeline ends here
    