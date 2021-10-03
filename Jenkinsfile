pipeline {
    agent {label 'worker'}
	
	stages{
	stage('clear project dir start'){
			steps{
				sh 'rm -rf petclinic-demo'}}
		stage('clone dev'){
			steps{
				sh 'git clone --branch dev https://github.com/AlexM-DO/petclinic-demo.git'
				sh 'cd petclinic-demo'}}
		stage('build and test'){
			steps{
				sh 'mvn clean package'
				junit '**/target/surefire-reports/TEST-*.xml'}}
		stage('clear project dir end'){
			steps{
				sh 'cd ..'
				sh 'rm -rf petclinic-demo'}}

}
}
