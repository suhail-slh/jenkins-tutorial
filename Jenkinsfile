pipeline {
    agent { docker { image 'maven:3.9.6-eclipse-temurin-17-alpine' } }
    stages {
        stage('build') {
            steps {
                sh 'chmod 755 ./flakey-deploy.sh'
                timeout(time: 2, unit: 'SECONDS') {
                    retry(5) {
                        sh './flakey-deploy.sh'
                    }
                }
            }
        }
    }
}