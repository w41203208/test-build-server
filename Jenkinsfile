pipeline {
  agent { node { label "Main" } }
  environment { 
    BRANCH_TYPE = ''
  }
  stages {
    stage('Check') {
      when {
        branch 'test-*'
      }
      steps {
        withEnv(["BRANCH_TYPE=test"]) {
          echo "----------- BRANCH_TYPE=${BRANCH_TYPE} -----------"
        }
        // echo TEST=${TEST}
        // echo BUILD_ID=${env.BUILD_ID}
        // echo BUILD_NUMBER=${env.BUILD_NUMBER}
        // echo BUILD_TAG=${env.BUILD_TAG}
        // echo BUILD_URL=${env.BUILD_URL}
        // echo EXECUTOR_NUMBER=${env.EXECUTOR_NUMBER}
        // echo JAVA_HOME=${env.JAVA_HOME}
        // echo JENKINS_URL=${env.JENKINS_URL}
        // echo JOB_NAME=${env.JOB_NAME}
        // echo NODE_NAME=${env.NODE_NAME}
        // echo WORKSPACE=${env.WORKSPACE}
      }
    }
    stage('Fix-Feature') {
      when {
        branch 'fix-*'
      }
      steps {
        withEnv(["BRANCH_TYPE=fix"]) {
          echo "----------- BRANCH_TYPE=${BRANCH_TYPE} -----------"
        }
      }
    }
    stage('Dev') {
      when {
        branch 'dev-*'
      }
      steps {
        withEnv(["BRANCH_TYPE=dev"]) {
          echo "----------- BRANCH_TYPE=${BRANCH_TYPE} -----------"
        }
        
      }
    }
    // stage('Checkout') {
    //   steps {
    //     git branch: 'dev', url: 'https://github.com/w41203208/test-build-server.git'
    //   }
    // }
    stage('Deploy') {
      when {
        branch 'main'
      }
      steps {
        withEnv(["BRANCH_TYPE=main"]) {
          echo "----------- BRANCH_TYPE=${BRANCH_TYPE} -----------"
        }
      }
    }
  }
}