# Stage 1: Build the JAR (using a Maven image)
FROM maven:3.8.6-amazoncorretto-17 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn package

# Stage 2: Create the final image (copy the JAR from Stage 1)
FROM openjdk:17-alpine  # Use a smaller base image for the final image

WORKDIR /home/petclinic/

COPY --from=build /app/target/jar.jar .  # Copy from the 'build' stage

EXPOSE 8080

ENV MYSQL_URL=jdbc:mysql://petclinic-mysql:3306/petclinic

CMD ["java", "-jar", "jar.jar"]