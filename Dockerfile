FROM golang:latest as builder

ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64
COPY main.go .
RUN go build -o /tmp/app main.go

# runtime image
FROM alpine
COPY --from=builder /tmp/app /app
EXPOSE 8081
ENTRYPOINT ["/app"]
