FROM maven:3-openjdk-11 as builder 
WORKDIR /project
COPY pom.xml /project/
RUN mvn clean verify --fail-never
COPY /src /project/src
RUN mvn package

FROM openjdk:11-jre-slim
WORKDIR /usr/src/app/
COPY --from=builder /project/target/*.jar /usr/src/app/
EXPOSE 8080
CMD [ "java", "-jar", "java-webapp-0.0.1.jar" ]