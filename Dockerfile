FROM ubuntu

RUN apt-get update && apt-get install -y make gcc python3-minimal iproute2 net-tools dnsmasq vim cargo
RUN echo PATH=$PATH:/root/.cargo/bin >> /root/.bashrc 
RUN cargo install dhcplayer

ADD . /workspace
WORKDIR /workspace
ENV PATH $PATH:/root/.cargo/bin

ENTRYPOINT [ "/bin/bash", "entrypoint.sh" ]
CMD ["dhcplayer"]