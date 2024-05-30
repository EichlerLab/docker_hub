FROM ubuntu:22.04

MAINTAINER Eichler Lab

ARG DEBIAN_FRONTEND=noninteractive

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
                 rsync

# Install samtools

RUN mkdir -p /opt/ucsc

WORKDIR /opt/ucsc

RUN rsync -aP hgdownload.soe.ucsc.edu::genome/admin/exe/linux.x86_64/ ./

ENV PATH=${PATH}:/opt/ucsc
