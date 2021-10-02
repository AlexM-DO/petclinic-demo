pipeline {
    agent {agent1}
	
	stages{
	       stage ('clone dev'){
	                           steps{
		                        sh 'git clone --branch dev https://github.com/AlexM-DO/petclinic-demo.git'}
	                           steps{
		                        sh 'cd petclinic-demo'}}
		stage ('build and test'){
				   steps{
					sh 'mvn clean package'
					junit '**/target/surefire-reports/TEST-*.xml'}}
		stage {'clear project dir'}{
				   steps{
					sh 'cd ..'
					sh 'rm -rf petclinic-demo'}}

}
