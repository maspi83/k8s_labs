#FROM debian:jessie
FROM golang:1.16-alpine
# install curl
#RUN apt-get update && apt-get install -qy curl

# install go runtime
#RUN curl -s https://storage.googleapis.com/golang/go1.2.2.linux-amd64.tar.gz | tar -C /usr/local -xz

# prepare go environment
ENV GOPATH /go
ENV GOROOT /usr/local/go
ENV PATH $PATH:/usr/local/go/bin:/go/bin

# add the current build context
RUN mkdir -p /go/src/github.com/deis/helloworld
COPY helloworld.go /go/src/github.com/deis/helloworld

# compile the binary
#RUN cd /go/src/github.com/deis/helloworld && go install -v .
RUN cd /go/src/github.com/deis/helloworld && go build -o .

EXPOSE 80

ENTRYPOINT ["/go/bin/helloworld"]