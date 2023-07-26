FROM eclipse-temurin:11-jdk-jammy
# CMD ["./mvnw", "clean", "package"]
ARG JAR_FILE_PATH=build/libs/*.jar
RUN pwd && find / -name '*.jar'
COPY ${JAR_FILE_PATH} app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
