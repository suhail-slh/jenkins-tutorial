pipeline {
    agent { docker { image 'maven:3.9.6-eclipse-temurin-17-alpine' } }
    stages {
        stage('build') {
            steps {
                sh 'echo "helloo dev branch"'
                sh 'chmod 755 ./flakey-deploy.sh'
                timeout(time: 5, unit: 'SECONDS') {
                    retry(1) {
                        sh './flakey-deploy.sh'
                    }
                }
                sh 'echo "byee dev branch"'
            }
        }
    }
    post {
        always {
            echo 'This will always run'
        }
        success {
            echo 'This will run only if successful'
        }
        failure {
            echo 'This will run only if failed'
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
        }
        changed {
            echo 'This will run only if the state of the Pipeline has changed'
            echo 'For example, if the Pipeline was previously failing but is now successful'
        }
        aborted {
            echo 'noooo'
        }
    }
}