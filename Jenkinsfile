pipeline {

agent any

stages {

stage('Checkout') {

steps {

checkout([$class: "GitSCM", branches: [[name: "*/main"]], extensions: [], userRemoteConfigs: [[url: "https://github.com/Abdul3006/TERRAFORM-3006"]]])

}

}

stage ("terraform init") {

steps {

sh ("terraform init")

}

}

stage ("terraform Action") {

steps {

echo "Terraform action is –> ${action}"

sh ("terraform ${action} –auto-approve")

}

}

}

}
