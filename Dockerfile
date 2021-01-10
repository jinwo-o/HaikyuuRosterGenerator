FROM golang:latest

WORKDIR /go/src/github.com/jinwo-o/HaikyuuRosterGenerator

# /go/src/github.com/jinwo-o/PatientData

COPY . .

RUN go get -d -v ./...
RUN go install -v ./...

RUN go build main.go

EXPOSE 8080
ENTRYPOINT [ "/go/src/github.com/jinwo-o/HaikyuuRosterGenerator/main" ]
