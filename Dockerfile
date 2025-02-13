FROM openjdk:25-oracle

WORKDIR /home/petclinic/

#COPY ./spring-petclinic-3.2.0-SNAPSHOT.jar .  
COPY ./target/spring-petclinic-3.2.0-SNAPSHOT.jar . 
#spring-petclinic-3.2.0-SNAPSHOT

EXPOSE 8080

ENV MYSQL_URL=jdbc:mysql://petclinic-mysql:3306/petclinic

CMD ["java", "-jar", "spring-petclinic-3.2.0-SNAPSHOT.jar"]
