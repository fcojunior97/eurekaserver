FROM maven:3.9.6-eclipse-temurin-17 as build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17
WORKDIR /app
COPY --from=build ./app/target/*.jar ./eurekaserver.jar
EXPOSE 8761
ENTRYPOINT java -jar eurekaserver.jar