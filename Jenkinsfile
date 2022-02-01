//Author: Ferdinand FONDONG LONGINU
//Declarative pipeline -stash comment
pipeline {

	//The label to specify in agent can be the node's name
	agent { label 'Build-In Node' }
	
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
		//parallel block maximizes efficiency when the stages do not depent on each other so they can run simultaneously.
		stage('upload&deploy'){
			parallel {
				stage('upload') {

					steps {
						sh "${mavenHome}/bin/mvn deploy"

					}
				}
				stage('deploy-tomcat') {
					steps {
						deploy adapters: [tomcat9(credentialsId: '7f6fc606-c9e7-47f1-a08d-e6eed61265b1', path: '', url: 'http://54.159.198.247:8080/')], contextPath: null, war: 'target/*war'
					}
				}
			}
		}
		stage('email-notifications') {
			steps {
				mail to: 'fondonglonginu.f12@gmail.com',
            	subject: "End of pipeline: ${BUILD_NUMBER}",
            	body: "Go to ${env.BUILD_URL} to verify the build"
			}
		}

	}
	//having to introduce the post block to make use of some variables
	post {
		failure {
			mail to: 'fondonglonginu.f12@gmail.com',
            subject: "Failed Pipeline: ${BUILD_NUMBER}",
            body: "Build failed: ${env.BUILD_URL}"
			echo "the build number is ${BUILD_NUMBER} and the workspace location: ${WORKSPACE}"
		}
		success {
			mail to: 'fondonglonginu.f12@gmail.com',
            subject: "Success! Pipeline: ${BUILD_NUMBER} buid successfully!",
            body: "BUil: ${BUILD_NUMBER} successfull!. GO to ${env.BUILD_URL} to check it. you can check the workspace at ${WORKSPACE}"
			echo "the build number is ${BUILD_NUMBER} and the workspace location: ${WORKSPACE}"
			echo "This is a self-configured declarative pipeline!!! by Ferdinand FONDONG LONGINU"
		}
	}
}
//this comment is to trigger a build in jenkins
//comment for a test build. new changes. latest changes 