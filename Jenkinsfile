pipeline {
      agent {label 'worker'}
   // agent {label 'agent1'}
	stages{
		stage('build and test'){
			steps{
				sh 'mvn clean package'
				junit '**/target/surefire-reports/TEST-*.xml'}}
}
          stages{
                stage('Clone repo to dev'){
                        agent {label 'prod'}
                        steps{
                                sh 'git clone https://github.com/AlexM-DO/petclinic-demo.git'
                                sh 'cd petclinic-demo'}}
                stage('Clear docker projects'){
                        agent {label 'prod'}
                        steps{
                                sh 'docker rm -vf $(docker ps -aq) && docker rmi -f $(docker images -aq) && docker volume prune -f'}}
                stage('Build new docker image'){
                        agent {label 'prod'}
                        steps{
                                sh 'docker build --tag java-pet-clinic:latest'}}
                stage('Run docker container'){
                        agent {label 'prod'}
                        steps{
                                sh 'docker docker run --name java-petclinic d -p 8080:8080 java-pet-clinic:latest'}}
        }
}
