pipeline {
    agent any
    // environment {
    //     GIT_CREDENTIALS_ID = 'b943825b-5659-4d27-9fdf-b19746a0bc16' //the ID of  Jenkins credentials
    // }
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
                       git branch: 'main', credentialsId: 'b943825b-5659-4d27-9fdf-b19746a0bc16', url: 'https://github.com/WencesKipsang/CICD_Docker.git' 
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
        
        stage('pushing image to docker') {
            steps {
                echo "Pushing"
                script {
                    dir('/root/frs_cicd/CICD_Docker') {
                        
                        
                        withCredentials([usernamePassword(credentialsId: '5af99eb7-b813-4c34-829c-19c33f8544c7', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                            sh '''
                            docker push wences3160/django_app:latest
                            '''
                        }
                                                                    
                        
                        echo "docker pushing images complete"
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