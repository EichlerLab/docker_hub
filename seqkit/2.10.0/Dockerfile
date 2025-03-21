FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ARG SEQKIT_VERSION=2.10.0

LABEL Maintanier="Eichler Lab"

# Default build libraries
RUN apt-get -qqy update --fix-missing && \
    apt-get -qqy dist-upgrade && \
    apt-get -qqy install --no-install-recommends \
                ca-certificates \
                libbz2-dev \
                libcurl4-openssl-dev \
                liblzma-dev \
                libncurses5-dev \
                autoconf \
                automake \
                bzip2 \
                gcc \
                g++ \
                git \
                make \
                wget \
                rsync \
                xz-utils \
                zlib1g-dev && \
                rm -rf /var/lib/apt/lists/*
# Install seqkit
WORKDIR /opt/seqkit

RUN wget https://github.com/shenwei356/seqkit/releases/download/v2.10.0/seqkit_linux_amd64.tar.gz && \
    tar -xvf seqkit_linux_amd64.tar.gz && \
    rm -f seqkit_linux_amd64.tar.gz

ENV PATH=/opt/seqkit:$PATH

WORKDIR /app

COPY ./software.list /app/

