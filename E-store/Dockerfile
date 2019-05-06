FROM alpine:3.9.2
ADD apache-tomcat-8.5.40.tar.gz  /opt/
RUN mv /opt/apache-tomcat-8.5.40 /opt/apache-tomcat
RUN apk add openjdk8-jre
#RUN rm /opt/apache-tomcat/conf/tomcat-users.xml
#COPY tomcat-users.xml /opt/apache-tomcat/conf/
COPY target/eStore.war /opt/apache-tomcat/webapps/
CMD ["/opt/apache-tomcat/bin/catalina.sh", "run"]
