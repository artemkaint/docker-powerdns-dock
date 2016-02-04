FROM golang

# go get to download all the deps
RUN go get -u github.com/artemkaint/docker-powerdns-dock

ADD . /go/src/github.com/artemkaint/docker-powerdns-dock
ADD plugins/ /plugins

RUN cd /go/src/github.com/artemkaint/docker-powerdns-dock && go install . ./...

ENTRYPOINT ["/go/bin/docker-powerdns-dock"]

ENV GOPATH /go
ENV GOROOT /usr/local/go
ENV PATH $PATH:/usr/local/go/bin:/go/bin
