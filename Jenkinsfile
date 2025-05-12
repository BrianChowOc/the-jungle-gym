pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Example build step
                echo 'Building the project...'
            }
        }

        stage('Test') {
            steps {
                // Example test step
                echo 'Running tests...'
            }
        }

        stage('Post-Test') {
            steps {
                // Example post-test step
                echo 'Tests completed!'
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
