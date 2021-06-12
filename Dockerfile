FROM golang:1.15-alpine
ADD . /go/src/checkip
RUN go install checkip

FROM alpine:latest
COPY --from=0 /go/bin/checkip .
ENV PORT 8080
CMD ["./checkip"]
