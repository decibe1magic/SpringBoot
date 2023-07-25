FROM eclipse-temurin:17-jdk-jammy
# CMD ["./mvnw", "clean", "package"]
ARG JAR_FILE_PATH=build/libs/*.jar
RUN pwd && ls -lR /home
# COPY ${JAR_FILE_PATH} app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]