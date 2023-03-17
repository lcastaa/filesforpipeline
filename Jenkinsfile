pipeline {
    agent any

    stages {


        stage('Build') {
            steps {
                sh 'bash ./mvnw clean install -Dmaven.test.skip=true -Dspring-boot.repackage.main-class=com.techelevator.tenmo'
            }
        }

        stage('Verify Artifact') {
            steps {
                script {
                    def artifactPath = sh(
                        script: 'ls target/*.jar',
                        returnStdout: true
                    ).trim()
                    if (artifactPath.empty) {
                        error 'Artifact not found'
                    }
                    echo "Artifact found at ${artifactPath}"
                }
            }
        }


        stage('Stop and Remove Previous Container ') {
            steps {
                script {
                    // Check if the container is already running
                    def containerName = "tenmoapp"

                    // Stop and delete the container if it is running
                    sh "sudo bash ./kill-and-remove-container.sh ${containerName}"
                }
            }
        }

       stage('Remove Previous Docker Image') {
            steps {
               sh 'sudo docker rmi -f $(sudo docker images -q pipe_myapp)'
            }
       }


        stage('Creating and Deploy Container') {
            steps {
                sh 'sudo docker-compose up --force-recreate -d'
            }
        }
    }

}
