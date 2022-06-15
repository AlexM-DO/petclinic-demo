pipeline {
      agent {label 'any'}
   // agent {label 'agent1'}
	stages{
		stage('build and test'){
			steps{
				sh 'mvn clean package' 
                        }
                }  
                stage('Build Docker image'){
                      //  agent {label 'any'}
                         steps{
                                sh 'sudo docker build --tag java-pet-clinic:$BUILD_VERSION .'
                                sh 'sudo docker image save java-pet-clinic:$BUILD_VERSION > pet-clinic-image.zip'
                         }
                }
								
        }
         post {
                        success {junit '**/target/surefire-reports/TEST-*.xml'
                        archiveArtifacts artifacts: 'pet-clinic-image.zip', fingerprint: true
                }
         }
}
// triger test1
