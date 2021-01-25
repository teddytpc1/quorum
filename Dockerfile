FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ubuntu-server && apt-get -y install make curl gcc
RUN curl -O https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz
RUN tar xvf go1.10.3.linux-amd64.tar.gz
RUN chown -R root:root ./go
RUN mv go /usr/local
ENV GOPATH=$HOME/work
ENV PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
WORKDIR /quorum
ADD ./bc/ /quorum/
#RUN cd bc 
RUN pwd && ls -la
RUN make all
RUN mkdir -p /quorum/node/data