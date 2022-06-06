### Building the image
ARG VER=18.2.0

FROM node:${VER}

LABEL developer=gabriel

# create a working directory
# mkdir /app && cd /app
WORKDIR /app

# make sure curl is installed
RUN apt update && apt install curl

# copy the files from local into container
ADD package.json .
ADD package-lock.json .
ADD public public
ADD views views
ADD main.js .

# install the packages
# equivalent to yarn install --frozen-lockfile
RUN npm ci 

### Running the image
ENV APP_PORT=3000

EXPOSE ${APP_PORT}

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
    CMD curl -s http://localhost:${APP_PORT}/healthz > /dev/null || exit 1

# run the application
ENTRYPOINT [ "node", "main.js" ]

