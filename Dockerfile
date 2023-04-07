FROM maven:3-openjdk-8 AS mbuilder
RUN mkdir /hello
RUN git clone <URL> /hello
WORKDIR /hello
RUN mvn package

FROM tomcat:9-jre8
COPY --from=mbuilder /hello/target/hello-world.war /usr/local/tomcat/webapps/
