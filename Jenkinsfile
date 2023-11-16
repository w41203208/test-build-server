pipeline {
  agent { node { label "Main" } }
  environment { 
    BRANCH_TYPE = ''
    EXCLUDE_BRANCH = 'main'
  }
  tools {
    nodejs 'NodeJS-18.16.0'
  }
  stages {
    // stage('Check') {
    //   when {
    //     branch 'test-*'
    //   }
    //   steps {
    //     withEnv(["BRANCH_TYPE=test"]) {
    //       echo "----------- BRANCH_TYPE=${BRANCH_TYPE} -----------"
    //       echo "Execute ${BRANCH_TYPE}"
    //     }
    //     // echo TEST=${TEST}
    //     // echo BUILD_ID=${env.BUILD_ID}
    //     // echo BUILD_NUMBER=${env.BUILD_NUMBER}
    //     // echo BUILD_TAG=${env.BUILD_TAG}
    //     // echo BUILD_URL=${env.BUILD_URL}
    //     // echo EXECUTOR_NUMBER=${env.EXECUTOR_NUMBER}
    //     // echo JAVA_HOME=${env.JAVA_HOME}
    //     // echo JENKINS_URL=${env.JENKINS_URL}
    //     // echo JOB_NAME=${env.JOB_NAME}
    //     // echo NODE_NAME=${env.NODE_NAME}
    //     // echo WORKSPACE=${env.WORKSPACE}
    //   }
    // }
    stage('Build') {
      expression {
        return env.EXCLUDE_BRANCH != 'main'
      }
      steps {
        script {
          sh '''
          npm -v
          npm install ts-node tsc typescript yarn
          '''

          sh '''
          yarn -v
          yarn upgrade --latest
          yarn
          '''

          sh 'yarn build'
        }
      }
    }
    stage('Fix-Feature') {
      when {
        branch 'fix-*'
      }
      steps {
        withEnv(["BRANCH_TYPE=fix"]) {
          echo "----------- BRANCH_TYPE=${BRANCH_TYPE} -----------"
          echo "Execute ${BRANCH_TYPE}"
        }
        script {
          sh 'yarn start'
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
          echo "Execute ${BRANCH_TYPE}"
        }
        script {

          sh '''
          echo Use this package - mocha to write unit test
          echo https://wshs0713.github.io/posts/e7656e62/
          '''
        }
      }
    }
    stage('PR') {
      when {
        branch 'PR-*'
      }
      steps {
        echo "Execute PR branch"
      }
    }
    stage('Deploy') {
      when {
        branch 'main'
      }
      steps {
        withEnv(["BRANCH_TYPE=main"]) {
          echo "----------- BRANCH_TYPE=${BRANCH_TYPE} -----------"
          echo "Execute ${BRANCH_TYPE}"
        }
        sshPublisher(publishers: [sshPublisherDesc(configName: 'w41203208_wanin@webrtc', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '''cd test/test-server-jay 
        sudo bash start-with-docker.sh
        ''', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: 'test/test-server-jay', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '**/*')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
      }
    }
  }
}