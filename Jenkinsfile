pipeline {
    agent any

    stages {


        stage('Building project using ./mvnw ...') {
            steps {
                sh 'bash ./mvnw clean install -Dmaven.test.skip=true'
            }
        }

        stage('Checking to see if the stage prior gives executable...') {
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


        stage('Stoping and removing the previous versions container...') {
            steps {
                script {
                    // Check if the container is already running
                    def containerName = "<name of container where spring is running>"

                    // Stop and delete the container if it is running
                    sh "sudo bash ./kill-and-remove-container.sh ${containerName}"
                }
            }
        }

       stage('Removing previous versions docker image...') {
            steps {
               sh 'sudo docker rmi -f $(sudo docker images -q <container image name>)'
            }
       }


        stage('Creating and deploying new versions container...') {
            steps {
                sh 'sudo docker-compose up --force-recreate -d'
            }
        }
    }

}
