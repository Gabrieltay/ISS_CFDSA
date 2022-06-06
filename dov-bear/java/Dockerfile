### Building the image
ARG VER=3.8-openjdk-17

FROM maven:${VER}

LABEL developer=gabriel

# create a working directory
# mkdir /app && cd /app
WORKDIR /app

# make sure curl is installed
# RUN apt update && apt install curl

# copy the files from local into container
ADD src src
ADD mvnw .
ADD mvnw.cmd .
ADD pom.xml .

# install the packages
# RUN mvn dependency:resolve

### Running the image
ENV APP_PORT=3000

EXPOSE ${APP_PORT}

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
    CMD curl -s http://localhost:${APP_PORT}/healthz > /dev/null || exit 1

# run the application
ENTRYPOINT [ "mvn", "spring-boot:run" ]

