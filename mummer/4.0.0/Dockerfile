FROM ubuntu:22.04

MAINTAINER Eichler Lab

ARG DEBIAN_FRONTEND=noninteractive

ENV NUCMER_VERSION="4.0.0rc1"

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

RUN wget https://github.com/mummer4/mummer/releases/download/v${NUCMER_VERSION}/mummer-${NUCMER_VERSION}.tar.gz && tar zxvf mummer-${NUCMER_VERSION}.tar.gz && cd mummer-${NUCMER_VERSION}/ && ./configure && make && make install

RUN rm -rf mummer-${NUCMER_VERSION}*

ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib/

RUN mkdir -p /app/ && echo -e "mummer=${NUCMER_VERSION}" > /app/software.list
