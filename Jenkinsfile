pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Tangala123/hiring'
            }
        }
        stage('Maven Build') {
            steps {
               sh "mvn clean package"
            }
        }
        stage('Tomcat Deploy') {
            steps {
                sshagent(['tomcat-ssh']) {
                    sh "scp -o StrictHostKeyChecking=no target/*.war ec2-user@172.31.52.202:/opt/tomcat9/webapps"
                    sh "ssh ec2-user@172.31.52.202 /opt/tomcat9/bin/shutdown.sh"
                    sh "ssh ec2-user@172.31.52.202 /opt/tomcat9/bin/startup.sh"
                }
            }
        }
    }
}
