FROM  golang:1.15-alpine AS build
COPY  . /go/src/checkip
RUN   go install checkip

FROM  alpine:3.14.2
COPY  --from=build /go/bin/checkip .
ENV   PORT 8080
CMD   ["./checkip"]
