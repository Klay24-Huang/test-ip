FROM golang:1.18.3-alpine3.16 as build
WORKDIR /App
COPY . .
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o /main ./main.go


FROM scratch
COPY --from=build /main /main
ENTRYPOINT ["/main"]

# cmd: docker build -f dockerfile .  -t test_ip_service
# docker run --rm -p 7071:7071 -d test_ip_service