FROM ubuntu:22.04

MAINTAINER Eichler Lab

ARG DEBIAN_FRONTEND=noninteractive

ENV MINIGRAPH_VERSION="0.21"

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
                 make \
                 wget \
                 zlib1g-dev \
                 git

# Install samtools

WORKDIR /opt/
RUN wget https://github.com/lh3/minigraph/releases/download/v${MINIGRAPH_VERSION}/minigraph-${MINIGRAPH_VERSION}_x64-linux.tar.bz2 && tar xvf minigraph-${MINIGRAPH_VERSION}_x64-linux.tar.bz2 && rm minigraph-${MINIGRAPH_VERSION}_x64-linux.tar.bz2


WORKDIR /

ENV PATH=${PATH}:/opt/minigraph-${MINIGRAPH_VERSION}_x64-linux/

RUN mkdir -p /app/ && echo -e "minigraph=${MINIGRAPH_VERSION}" > /app/software.list
