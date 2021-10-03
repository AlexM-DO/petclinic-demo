pipeline {
      agent {label 'worker'}
   // agent {label 'agent1'}
	stages{
		stage('build and test'){
			steps{
				sh 'mvn clean package'
				junit '**/target/surefire-reports/TEST-*.xml'}}
                
                stage('Clear docker projects'){
                       // agent {label 'prod'}
                        steps{
                                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE'){ //if docker images and containers not created
                                sh 'sudo docker stop $(sudo docker ps -aq) && sudo docker rm -vf $(sudo docker ps -aq) && sudo docker rmi -f $(sudo docker images -aq) && sudo docker volume prune -f'}}}
				stage('Build new production image'){
                       // agent {label 'agent1'}
                        steps{
                                sh 'sudo docker build --tag java-pet-clinic:latest .'}}
                stage('Run new production container'){
                      //  agent {label 'agent1'}
                        steps{
                                sh 'sudo docker run -d -p 8080:8080 --name java-petclinic java-pet-clinic:latest'}}
								
        }
}
// triger test1
