# Use a Maven image to build the app
FROM maven:3.8.4-openjdk-11 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Use a lightweight image for running the app
FROM openjdk:11-jre-slim
COPY --from=build /app/target/simple-java-app-1.0-SNAPSHOT.jar /usr/local/bin/simple-java-app.jar
ENTRYPOINT ["java", "-jar", "/usr/local/bin/simple-java-app.jar"]
