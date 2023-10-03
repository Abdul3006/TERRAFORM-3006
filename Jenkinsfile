pipeline {

    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    } 
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AKIAYOK2YLFDJXZMS66I')
        AWS_SECRET_ACCESS_KEY = credentials('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')
    }

   agent  any
    stages {
        stage('Git checkout') {
            steps {
                 script{
                        dir("terraform")
                        {
                            checkout([$class: "GitSCM", branches: [[name: "*/main"]], extensions: [], userRemoteConfigs: [[url: "https://github.com/Abdul3006/TERRAFORM-3006.git"]]])
                        }
                    }
                }
            }

        stage('Plan') {
            steps {
                sh 'pwd;cd terraform/ ; terraform init'
                sh "pwd;cd terraform/ ; terraform plan -out tfplan"
                sh 'pwd;cd terraform/ ; terraform show -no-color tfplan > tfplan.txt'
            }
        }
        stage('Approval') {
           when {
               not {
                   equals expected: true, actual: params.autoApprove
               }
           }

           steps {
               script {
                    def plan = readFile 'terraform/tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
               }
           }
       }

        stage('Apply') {
            steps {
                sh "pwd;cd terraform/ ; terraform apply -input=false tfplan"
            }
        }
    }

  }
