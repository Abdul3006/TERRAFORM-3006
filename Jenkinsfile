pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID = credentials('AKIAYOK2YLFDJXZMS66I')
        AWS_SECRET_ACCESS_KEY = credentials('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')
    }

    stages {
        stage('Checkout') {
            steps {
                // Clone the repository
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                // Initialize Terraform
                sh 'terraform init'
            }
        }

        stage('Terraform Apply') {
            steps {
                // Run Terraform apply with AWS credentials
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY', credentialsId: 'AKIAYOK2YLFDJXZMS66I,Xrh7tGos5HgbQh1DMn9P8kUMMsKBD3KCX1VuIh0w']]) {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }

    post {
        success {
            // Add any post-success actions here
        }
        failure {
            // Add any post-failure actions here
        }
    }
}
