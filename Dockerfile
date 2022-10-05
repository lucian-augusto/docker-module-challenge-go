FROM golang:latest AS builder

WORKDIR /usr/src/app

COPY ./hello.go .

RUN go build hello.go

FROM scratch
WORKDIR /usr/bin
COPY --from=builder /usr/src/app/hello .
ENTRYPOINT [ "hello" ]
