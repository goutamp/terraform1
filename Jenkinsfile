pipeline {
    agent any
    
    
     environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
                
            }
        }
         stage('Checkout code') {
        steps {
            checkout scm
         }
       }
        stage("Get the variable and Build Number"){
            steps{
                echo "The build number is ${env.goutam}"
                echo "You can also use \${BUILD_NUMBER} -> ${BUILD_NUMBER}" 
                sh 'terraform --version'
                sh 'terraform init'
            }
        }
        stage("Check the git version"){
            steps{
                sh 'git --version'                                                
            }
        }
    }
}
