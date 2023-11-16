pipeline {
  agent { label "Main" }
  stages {
    stage("Check") {
      environment { 
        TEST = 'test'
      }
      steps {
        echo TEST=${TEST}
        echo BUILD_ID=${env.BUILD_ID}
        echo BUILD_NUMBER=${env.BUILD_NUMBER}
        echo BUILD_TAG=${env.BUILD_TAG}
        echo BUILD_URL=${env.BUILD_URL}
        echo EXECUTOR_NUMBER=${env.EXECUTOR_NUMBER}
        echo JAVA_HOME=${env.JAVA_HOME}
        echo JENKINS_URL=${env.JENKINS_URL}
        echo JOB_NAME=${env.JOB_NAME}
        echo NODE_NAME=${env.NODE_NAME}
        echo WORKSPACE=${env.WORKSPACE}
      }
    }
    // stage('Checkout') {
    //   steps {
    //     git branch: 'dev', url: 'https://github.com/w41203208/test-build-server.git'
    //   }
    // }
    stage("Build") {
      steps {
        echo "----------- Build -----------"
      }
    }
  }
}