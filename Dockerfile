FROM ubuntu
MAINTAINER Carlos Badenes-Olmedo <carlos.badenes@upm.es>

RUN apt-get update
RUN apt-get install -y openjdk-8-jdk curl
RUN apt-get clean
RUN java -version

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat

RUN curl -O https://downloads.apache.org/tomcat/tomcat-8/v8.5.98/bin/apache-tomcat-8.5.98.tar.gz

RUN tar zxvf apache*.tar.gz
RUN mv apache-tomcat-8.5.98/* /opt/tomcat/.

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]



