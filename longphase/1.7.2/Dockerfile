FROM ubuntu:22.04

WORKDIR /opt

# basic stuff
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        wget \
        curl \
        tar \
        xz-utils \
        git \
        build-essential \
        autoconf \
        automake \
        libtool \
        zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

# longphase
RUN wget https://github.com/twolinin/longphase/releases/download/v1.7.2/longphase_linux-x64.tar.xz && \
    tar -xJf longphase_linux-x64.tar.xz && \
    mv longphase_linux-x64 /opt/longphase && \
    rm -rf longphase_linux-x64.tar.xz

ENV PATH="/opt/longphase:${PATH}"

