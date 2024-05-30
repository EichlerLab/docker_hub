FROM ubuntu:22.04

MAINTAINER William T Harvey

ARG P2C_VERSION="0.1.1"

# Default build libraries
RUN apt-get -qqy update --fix-missing && \
    apt-get -qqy dist-upgrade && \
    apt-get -qqy install --no-install-recommends  \
                 ca-certificates \
                 libbz2-dev \
                 libcurl4-openssl-dev \
                 liblzma-dev \
                 libncurses5-dev \
                 autoconf \
                 automake \
                 bzip2  \
                 cmake \
                 gcc \
                 g++ \
                 make \
                 wget \
                 cargo \
                 git \
                 zlib1g-dev # buildkit



RUN git clone https://github.com/AndreaGuarracino/paf2chain && cd paf2chain && git checkout v${P2C_VERSION} && cargo install --force --path .


RUN cp /root/.cargo/bin/* /usr/bin/


RUN mkdir -p /app/ && echo -e "paf2chain=${P2C_VERSION}" > /app/software.list