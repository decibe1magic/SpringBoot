FROM eclipse-temurin:17-jdk-jammy
# CMD ["./mvnw", "clean", "package"]
# ARG JAR_FILE_PATH=build/libs/*.jar
# RUN pwd && find / -name '*.jar'
# COPY ${JAR_FILE_PATH} app.jar
# ENTRYPOINT ["java", "-jar", "app.jar"]

ARG JAR_FILE_PATH=build/libs/*.war
RUN pwd && find / -name '*.war'
COPY ${JAR_FILE_PATH} app.war
ENTRYPOINT ["java", "-war", "wpp.jar"]