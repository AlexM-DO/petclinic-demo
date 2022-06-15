pipeline {
      agent any
      tools { 
      maven 'M3' 
      jdk 'java9'
    }
   // agent {label 'agent1'}
	stages{
		stage('build and test'){
			steps{
				sh 'mvn clean package' 
                        }
                }  
                stage('Build Docker image'){
                      //  agent any
                         steps{
                                sh 'sudo docker build --tag java-pet-clinic:latest .'
                                sh 'mkdir artifacts'
                                sh 'sudo docker image save java-pet-clinic:latest > ./artifacts/pet-clinic-image-$BUILD_TIMESTAMP.zip'
                                
                         }
                }
								
        }
         post {
                        success {junit '**/target/surefire-reports/TEST-*.xml'
                        archiveArtifacts artifacts: './artifacts', fingerprint: true
                        sh 'sudo docker rmi -f java-pet-clinic:latest'
                        sh 'rm -rf ./artifacts'
                        
                }
         }
}
// triger test1
