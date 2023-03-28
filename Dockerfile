# Etapa de construção
FROM golang:alpine AS builder

WORKDIR /app
COPY main.go .

RUN go build main.go

# Etapa de execução
FROM scratch
COPY --from=builder /app/main /app/main

CMD ["/app/main"]
