FROM golang:1.10.3
COPY . /go/src/keel
WORKDIR /go/src/keel
RUN go build -v -o /go/bin/keel

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=0 /go/bin/keel /bin/keel
ENTRYPOINT ["/bin/keel"]

EXPOSE 9300
