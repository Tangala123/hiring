FROM alpine:3.17
LABEL AUTHOR="Java Home"
RUN apk add openjdk17-jre
WORKDIR /opt
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.80/bin/apache-tomcat-9.0.80.tar.gz .
RUN tar xf apache-tomcat-9.0.80.tar.gz
RUN rm -rf apache-tomcat-9.0.80.tar.gz
RUN mv apache-tomcat-9.0.80 tomcat9
COPY target/hiring.war /opt/tomcat9/webapps
EXPOSE 8080
CMD ["/opt/tomcat9/bin/catalina.sh", "run"]