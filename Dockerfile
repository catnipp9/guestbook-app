# Stage 1: Build the application
FROM golang:1.15 AS builder
WORKDIR /app
COPY . .

# Download Go 1.15 compatible versions of the dependencies
RUN go get github.com/codegangsta/negroni \
           github.com/gorilla/mux@v1.8.0 \
           github.com/xyproto/simpleredis/v2

RUN go build -o guestbook main.go

# Stage 2: Final lightweight image
FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/guestbook .
COPY public/ public/
EXPOSE 3000
CMD ["./guestbook"]