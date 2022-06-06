### Building the image
ARG ALP_VER=3.16

FROM golang:alpine${ALP_VER} AS builder

# create a working directory
# mkdir /app && cd /app
WORKDIR /app

# copy the files from local into container
ADD go.mod .
ADD go.sum .
ADD main.go .

# build and produce executable
RUN go build -o main.app main.go

FROM alpine:${ALP_VER}

LABEL org.opencontainers.image.source=https://github.com/Gabrieltay/nodeJsRepo

WORKDIR /app

COPY --from=builder /app/main.app main.app

ADD public public
ADD templates templates

ENV APP_PORT=3000

EXPOSE ${APP_PORT}

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
    CMD curl -s http://localhost:${APP_PORT}/healthz > /dev/null || exit 1

# run the application
ENTRYPOINT [ "./main.app" ]

