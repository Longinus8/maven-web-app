pipeline {
	
	agent any
	
	environment {
		mavenHome = tool name: 'maven3.8.4'
	}

	stages {
		stage('github-scm-pull') {

			steps {
			    git credentialsId: 'ee873c3a-7930-4f9c-9e43-058653ac8b95', url: 'https://github.com/Longinus8/maven-web-app'
				
			}
		}	
		stage('build') {

			steps {
				sh "${mavenHome}/bin/mvn clean package"

			}	
		}
		stage('test') {

			steps {
				sh "${mavenHome}/bin/mvn sonar:sonar"

			}
		}
		stage('upload') {

			steps {
				sh "${mavenHome}/bin/mvn deploy"

			}
		}
		stage('deploy') {
			steps {
				echo "nothing to commit here..."
			}
		}
		stage('email-notifications') {
			steps {
				echo "no email notification for now..."
			}
		}

	}
}