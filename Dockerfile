FROM adoptopenjdk/openjdk11:jdk-11.0.2.9-slim

COPY target/m02-capstone-server-0.0.1-SNAPSHOT.jar /app.jar
COPY src/main/resources/application.properties /app/application.properties

ENTRYPOINT ["java","-jar","app.jar"]