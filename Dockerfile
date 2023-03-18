FROM adoptopenjdk/openjdk11:jdk-11.0.2.9-slim

COPY target/<name of .mvmw output file>.jar /app.jar
COPY src/main/resources/application.properties /app/application.properties

ENTRYPOINT ["java","-jar","app.jar"]
