FROM openjdk:8
RUN mkdir -p /app

# Copy app artifact
ADD target/sidekick-demo-0.0.1.jar /app/sidekick-demo-0.0.1.jar

# Copy Sidekick bootstrap agent artifact. 
# Please rename with the file you have downloaded at the first step.
ADD sidekick-agent-bootstrap-0.0.10.jar /app/sidekick-agent-bootstrap-0.0.10.jar

WORKDIR /app
EXPOSE 8080
ENTRYPOINT [ "java", "-javaagent:sidekick-agent-bootstrap-0.0.10.jar", "-jar", "sidekick-demo-0.0.1.jar" ]