pipeline {
    agent any

    stages {
        stage('Setup Python Virtual ENV checkout') {
            steps {
                script {
                    dir('/root/frs_cicd') {

                        if (!fileExists('CICD_Docker')) {
                            sh 'mkdir CICD_Docker'
                            dir('/root/frs_cicd/CICD_Docker') {
                                git branch: 'main', url: 'https://github.com/WencesKipsang/CICD_Docker.git' 
                            }
                        }
                        if (fileExists('CICD_Docker')){
                            dir('/root/frs_cicd/CICD_Docker') {
                                git branch: 'main', url: 'https://github.com/WencesKipsang/CICD_Docker.git' 
                            }
                        }
                                                                     
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
        
        
        stage('Release') {
            steps {
                echo "Releasing"
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