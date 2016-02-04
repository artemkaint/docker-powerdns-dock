#!/bin/bash
echo $(stat -c '%U' /gosdk)
#cp -a /usr/local/go /gosdk
#ls -s /go /golib
#
#go get -u github.com/robertkrimen/otto
#go get -u github.com/artemkaint/go-powerdns-client
#go get -u github.com/skynetservices/skydns1/client
#go get -u github.com/skynetservices/skydns1/msg