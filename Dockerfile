FROM tomcat:8.0.20-jre8
#nothing to commit
# Dummy text to test 
COPY target/maven-web-application*.war /usr/local/tomcat/webapps/maven-web-application.war
