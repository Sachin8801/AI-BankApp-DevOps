# The base line for the code- Java

FROM eclipse-temurin:21-jdk-alpine

# Create the work directory for the code 

WORKDIR /app

# Copying the code to the directory 

COPY . .

# Installing libraries for Maven 

RUN chmod +x mvnw && ./mvnw clean package -DskipTests

# Running the command for entry to the app also can be done with ENTRYPOINT ["sh", "cd", "java -jar target/*.jar"]

ENTRYPOINT ["sh","-c","java -jar target/*.jar"]

# Exposing the port 

EXPOSE 8080

