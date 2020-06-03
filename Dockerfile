ARG maven_image=maven
ARG maven_image_tag=3.6.2-jdk-11
ARG openjdk_image=usgswma/openjdk
ARG openjdk_image_tag=11.0.4-jre-baa3726df925e679dedf110bc1dca29b323e5324

FROM ${maven_image}:${maven_image_tag} AS build
LABEL maintainer="gs-w_eto_eb_federal_employees@usgs.gov"

# Add pom.xml and install dependencies
COPY pom.xml /build/pom.xml
WORKDIR /build
RUN mvn -B dependency:go-offline

# Add source code and (by default) build the jar
COPY src /build/src
RUN mvn -B clean package -Dmaven.test.skip=true

FROM ${openjdk_image}:${openjdk_image_tag}

RUN apt-get update && apt-get install --no-install-recommends --no-upgrade -y \
    curl \
 && rm -rf /var/lib/apt/lists/*

COPY --chown=1000:1000 --from=build /build/target/hello-world-spring-boot*.jar app.jar

USER $USER

CMD ["java", "-jar", "app.jar"]
