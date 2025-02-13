FROM openjdk:25-oracle

WORKDIR /home/petclinic/

COPY ./jar.jar .  
#spring-petclinic-3.2.0-SNAPSHOT

EXPOSE 8080

ENV MYSQL_URL=jdbc:mysql://petclinic-mysql:3306/petclinic

CMD ["java", "-jar", "jar.jar"]
#spring-petclinic-3.2.0-SNAPSHOT