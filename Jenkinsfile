pipeline {
    agent any

    environment {
        GIT_CREDENTIALS_ID = 'b943825b-5659-4d27-9fdf-b19746a0bc16' //the ID of  Jenkins credentials
    }

    stages {
        stage('Setup Python Virtual ENV') {
            steps {
                script {
                    dir('/root/frs_cicd') {

                        if (!fileExists('CICD_Docker')) {
                            sh 'mkdir CICD_Docker'                            
                        }
                                                                    
                    } 
                }              

            }
        }

        stage('checkout') {
            steps {
                script {
                    dir('/root/frs_cicd/CICD_Docker') {
                       git branch: 'main', url: 'https://github.com/WencesKipsang/CICD_Docker.git',credentialsId: env.GIT_CREDENTIALS_ID  
                    } 
                }
            }
        }

        
        stage('Build') {
            steps {
                echo "Building"
                script {
                    dir('/root/frs_cicd/CICD_Docker') {
                        sh '''
                        docker compose build --no-cache
                        docker compose up -d                       
                        '''
                        echo "docker images complete"
                    } 
                }
            }
        }
        
    
    }
    post {
        success {
            echo "Build successful"
            // You can add additional steps here, like running tests or notifications.
        }

        failure {
            echo "Build failed"
        }
    }
}