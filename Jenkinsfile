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
                sh 'terraform init -input=false'
               
                sh "terraform plan -input=false -out tfplan "
                sh 'terraform show -no-color tfplan > tfplan.txt'
            }
        }
        stage('Approval') {
           when {
               not {
                   equals expected: true, actual: params.autoApprove
               }
               not {
                    equals expected: true, actual: params.destroy
                }
           }
           
                
            

           steps {
               script {
                    def plan = readFile 'tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
               }
           }
        }
        stage('Apply') {
            when {
                not {
                    equals expected: true, actual: params.destroy
                }
            }
            
            steps {
                sh "terraform apply -input=false tfplan"
            }
        }
        stage('Destroy') {
            when {
                equals expected: true, actual: params.destroy
            }
        
        steps {
           sh "terraform destroy --auto-approve"
         }
        }    
        stage("Check the git version"){
            steps{
                sh 'git --version'                                                
            }
        }
    }
}
