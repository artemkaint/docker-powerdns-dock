FROM golang

RUN groupadd -g 1000 docker
RUN useradd -u 1000 -g 1000 -d /tmp docker

VOLUME /gosdk
VOLUME /golib
VOLUME /tmp/go

COPY develop.sh /develop.sh
RUN chown docker:docker /develop.sh
RUN chmod +x /develop.sh
RUN chown docker:docker /gosdk
RUN chown docker:docker /golib
RUN chown docker:docker /tmp/go

#ENTRYPOINT ["/develop.sh"]

ENV GOPATH /tmp/go
ENV GOROOT /usr/local/go
ENV PATH $PATH:/usr/local/go/bin:/tmp/go/bin

USER docker
