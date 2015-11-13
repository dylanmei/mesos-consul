FROM debian:jessie

MAINTAINER Chris Aubuchon <Chris.Aubuchon@gmail.com>

COPY . /go/src/github.com/CiscoCloud/mesos-consul

RUN apt-get update -y \
 && apt-get install -y golang git mercurial \
 && cd /go/src/github.com/CiscoCloud/mesos-consul \
 && export GOPATH=/go \
 && go get \
 && go build -o /bin/mesos-consul \
 && apt-get autoremove -y golang git mercurial \
 && apt-get clean \
 && rm -rf /go \
 && rm -rf /var/lib/apt/lists/*
ENTRYPOINT [ "/bin/mesos-consul" ]
