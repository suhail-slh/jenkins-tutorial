pipeline {
    agent { docker { image 'maven:3.9.6-eclipse-temurin-17-alpine' } }
    stages {
        stage('build') {
            steps {
                timeout(time: 2, unit: 'SECONDS') {
                    retry(5) {
                        sh './flakey-deploy.sh'
                        sh 'echo "Lemme try again"'
                    }
                    sh 'echo "no more retries"'
                }
            }
        }
    }
}