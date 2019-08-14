FROM alpine:3.9.3

ENV CLAIR_ADDR 7ee251fd10d6:6060
ENV CLAIR_OUTPUT Low

RUN apk add --no-cache ca-certificates
COPY klar /klar

ENTRYPOINT ["/klar"]