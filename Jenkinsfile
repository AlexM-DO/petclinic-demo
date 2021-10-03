pipeline {
   // agent {label 'worker'}
      agent {label 'agent1'}
	stages{
	stage('clear project dir start'){
			steps{
				sh 'rm -rf petclinic-demo'}}
		stage('clone'){
			steps{
				sh 'git clone https://github.com/AlexM-DO/petclinic-demo.git'
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
