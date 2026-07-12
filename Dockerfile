# 多阶段构建 — Go worker
FROM golang:1.22-alpine AS builder
RUN apk add --no-cache git ca-certificates
WORKDIR /src
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -o /worker ./cmd/worker

FROM alpine:3.20
RUN addgroup -g 1001 -S app && adduser -S app -u 1001 -G app
RUN apk add --no-cache ca-certificates tzdata
COPY --from=builder --chown=app:app /worker /worker
USER app
ENTRYPOINT ["/worker"]
