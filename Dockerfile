FROM tomcat:8.0.20-jre8
#nothing to commit. this time you have to work. jjj
# Dummy text to the training. now hooking to jen kings
COPY target/maven-web-application*.war /usr/local/tomcat/webapps/maven-web-application.war
