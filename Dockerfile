# Use OpenJDK 17 on Alpine as base image
FROM openjdk:17-jdk-alpine

# Define the location of your .jar file
ARG JAR_FILE=build/libs/Jhooq-k8s-0.0.1-SNAPSHOT.jar

# Rename the JAR file during copy (copy it as app.jar inside the container)
COPY ${JAR_FILE} /app.jar

# Create destination directory for added files
RUN mkdir -p /destination-dir-for-add

# Copy and unpack sample.tar.gz into the container (if necessary)
ADD sample.tar.gz /destination-dir-for-add

# Define the entry point to run your application
ENTRYPOINT ["java", "-jar", "/app.jar"]
