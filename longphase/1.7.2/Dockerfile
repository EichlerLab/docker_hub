FROM ubuntu:22.04

# basic stuff
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates git g++ gcc autoconf make zlib1g-dev libbz2-dev liblzma-dev && \
    rm -rf /var/lib/apt/lists/*


# longphase
WORKDIR /opt/longphase
RUN git clone https://github.com/twolinin/longphase.git /opt/longphase && \
    autoreconf -i && \
    ./configure && \
    make -j 4 && \
    rm -rf /opt/longphase/.git

ENV PATH="${PATH}":${HOME}/bin:/opt/longphase

