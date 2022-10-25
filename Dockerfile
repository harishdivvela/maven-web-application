##FROM tomcat:8.0.20-jre8
##COPY target/maven-web-app*.war /usr/local/tomcat/webapps/maven-web-application.war
FROM tomcat:8
LABEL app=my-app
COPY target/*.war /usr/local/tomcat/webapps/myweb.war
