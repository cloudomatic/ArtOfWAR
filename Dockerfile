FROM tomcat
ADD debug.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
