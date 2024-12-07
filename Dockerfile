# Use OpenJDK 17 on Alpine as the base image
FROM openjdk:17-jdk-alpine

# Create a directory for the copied JAR file
RUN mkdir /app

# Copy all .jar files into the /app directory
COPY build/libs/*.jar /app/

# Rename the first .jar file to app.jar
RUN mv /app/*.jar /app/app.jar

# Create destination directory for added files
RUN mkdir -p /destination-dir-for-add

# Copy and unpack sample.tar.gz into the container (if necessary)
ADD sample.tar.gz /destination-dir-for-add

# Define the entry point to run your application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
