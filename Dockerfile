FROM golang:latest

WORKDIR /Work/HaikyuuRosterGenerator
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...

RUN go build main.go

EXPOSE 8080
ENTRYPOINT [ "/Work/HaikyuuRosterGenerator/main" ]
