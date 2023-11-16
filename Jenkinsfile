pipeline {
  agent { node { label "Main" } }
  stages {
    stage('Check') {
      environment { 
        BRANCH_TYPE = 'test'
      }
      when {
        branch 'test-*'
      }
      steps {
        echo "Hello, $BRANCH_TYPE"
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
      environment { 
        BRANCH_TYPE = 'fix'
      }
      when {
        branch 'fix-*'
      }
      steps {
        sh '''
          echo "Hello, $BRANCH_TYPE"
        '''
      }
    }
    stage('Dev') {
      environment { 
        BRANCH_TYPE = 'dev'
      }
      when {
        branch 'dev-*'
      }
      steps {
        echo "Hello, $BRANCH_TYPE"
      }
    }
    // stage('Checkout') {
    //   steps {
    //     git branch: 'dev', url: 'https://github.com/w41203208/test-build-server.git'
    //   }
    // }
    stage('Build') {
      steps {
        echo "----------- Build $BRANCH_TYPE -----------"
      }
    }
    stage('Deploy') {
      when {
        branch 'main'
      }
      environment { 
        BRANCH_TYPE = 'main'
      }
      steps {
        script {
          sh '''
            echo "Hello, $BRANCH_TYPE"
          '''
        }
      }
    }
  }
}