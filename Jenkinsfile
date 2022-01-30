//Author: Ferdinand FONDONG LONGINU
//Declarative pipeline -stash comment
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
				mail to: 'fondonglonginu.f12@mail.com',
            	subject: "Failed Pipeline: ${BUILD_NUMBER}",
            	body: "Build failed: ${env.BUILD_URL}"
			}
		}

	}
	//having to introduce the post block to make use of some variables
	post {
		failure {
			echo "the build number is ${BUILD_NUMBER} and the workspace location: ${WORKSPACE}"
		}
		success {
			echo "the build number is ${BUILD_NUMBER} and the workspace location: ${WORKSPACE}"
			echo "This is a self-configured declarative pipeline!!! by Ferdinand FONDONG LONGINU"
		}
	}
}
//this comment is to trigger a build in jenkins