FROM tomcat:8.0.20-jre8
#nothing to commit. this time you have to work
# Dummy text to the training
COPY target/maven-web-application*.war /usr/local/tomcat/webapps/maven-web-application.war
