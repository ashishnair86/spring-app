FROM docker.io/library/maven:3.9-eclipse-temurin-17 AS build

COPY . .

RUN mvn clean package

FROM docker.io/library/eclipse-temurin:17-jre

WORKDIR /app

COPY target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]
