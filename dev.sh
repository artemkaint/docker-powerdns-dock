#!/bin/bash
docker run --rm \
            -ti \
            -v /var/run/docker.sock:/docker.sock \
            -v /home/artemkaint/dev/docker-powerdns-dock:/go/src/github.com/artemkaint/docker-powerdns-dock \
            -v /home/artemkaint/dev/docker-powerdns-dock/.sdk:/usr/local/gosdk \
            --name docker-powerdns-dock \
            -w /go/src/github.com/artemkaint/docker-powerdns-dock \
            golang bash

docker run --rm \
            -ti \
            -v /var/run/docker.sock:/docker.sock \
            -v /home/artemkaint/dev/docker-powerdns-dock:/go/src/github.com/artemkaint/docker-powerdns-dock \
            -v /home/artemkaint/dev/docker-powerdns-dock/.sdk:/gosdk \
            -v /home/artemkaint/dev/docker-powerdns-dock/.sdk/custom:/golib \
            --name docker-powerdns-dock \
            -w /go/src/github.com/artemkaint/docker-powerdns-dock \
            -u docker \
            docker-powerdns-dock-develop bash

docker run --rm \
            -ti \
            -v /var/run/docker.sock:/docker.sock \
            -v /home/artemkaint/dev/docker-powerdns-dock:/tmp/go/src/github.com/artemkaint/docker-powerdns-dock \
            -v /home/artemkaint/dev/docker-powerdns-dock/.sdk:/tmp/gosdk \
            -v /home/artemkaint/dev/docker-powerdns-dock/.sdk/custom:/tmp/golib \
            --name docker-powerdns-dock \
            -w /go/src/github.com/artemkaint/docker-powerdns-dock \
            -u docker docker-powerdns-dock-develop bash

cp -a /usr/local/go /usr/local/gosdk
go get -u github.com/robertkrimen/otto
go get -u github.com/artemkaint/go-powerdns-client
go get -u github.com/skynetservices/skydns1/client
go get -u github.com/skynetservices/skydns1/msg

reset && go run ./*.go -ttl 30 -environment dev -s /docker.sock -domain docker -name powerdns
reset && go install . ./...

/go/bin/docker-powerdns-dock -ttl 30 -environment dev -s /docker.sock -domain docker -name powerdns
