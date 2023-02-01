FROM openjdk:8-jre
#ADD target/productcatalogue-0.0.1-SNAPSHOT.jar app.jar
#ADD product-catalogue.yml app-config.yml
#EXPOSE 8020
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","app.jar", "server", "app-config.yml"]

ARG JAR_FILE=target/productcatalogue-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} app.jar

RUN mkdir destination-dir-for-add
ADD sample.tar.gz /destination-dir-for-add

ENTRYPOINT ["java","-jar","/app.jar"]
