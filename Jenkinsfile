pipeline {
    agent any

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

        stage('Checkout') {
            steps {
                script {
                        dir('/root/frs_cicd/CICD_Docker') {
                            git branch: 'main', url: 'https://github.com/WencesKipsang/CICD_Docker.git' 
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
                        docker compose up -d                       
                        '''
                        echo "docker images complete"
                    } 
                }
            }
        }
        
        stage('Deploy') {
            steps {
                echo "setting up gunicorn"
                script {
                    dir('/root/frs_cicd/CICD_Docker') {
                    sh '''
                    chmod 755 /root/frs_cicd/CICD_Docker
                    chmod +x  gunicorn.sh
                    ./gunicorn.sh

                    '''                    
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