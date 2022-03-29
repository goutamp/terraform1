pipeline {
    agent any

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
            }
        }
        stage("Check the git version"){
            steps{
                sh 'git --version'                                                
            }
        }
    }
}
