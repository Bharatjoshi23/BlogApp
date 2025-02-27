FROM maven:3.8.2-openjdk-17-slim AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/Blog-applicationDeploy-0.0.1-SNAPSHOT.jar Blog-applicationDeploy.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","Blog-applicationDeploy.jar"]
