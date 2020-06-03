# Water Data for the Nation

Simple hello world app to test Jenkins pipeline deploy.
Modified from wma Engineering branch hello-world-spring-boot application.

## Development
This is a Spring Boot project. All of the normal caveats relating to a Spring Boot application apply.

### Environment Variables
To run in a development environment, create an application.yml file in the project root directory containing the following (shown are example values):

```.yml
ROOT_LOG_LEVEL: "INFO"
SERVER_PORT: "8080"
SERVER_CONTEXT_PATH: "/api/greetings"
```
Can the be run using maven:
mvn spring-boot:run

## Testing
This project contains JUnit tests. They can be run with maven:
mvn test

### Database Integration Testing
no Integration tests at the moment.
