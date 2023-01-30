FROM golang:1.16 as builder
RUN apt-get update && apt-get install -y git && apt-get install -y build-essential
RUN mkdir -p /app/src
WORKDIR /app/src/
RUN git clone https://github.com/Fenikks/word-cloud-generator.git .
RUN make 

FROM alpine:latest
RUN apk add --no-cache libc6-compat
COPY --from=builder /app/src/artifacts/linux/word-cloud-generator .
CMD ./word-cloud-generator
