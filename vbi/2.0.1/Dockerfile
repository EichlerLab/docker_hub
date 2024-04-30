FROM ubuntu:22.04

MAINTAINER William T Harvey

ARG VBI_VERSION=2.0.1
ARG SAMTOOLS_VERSION=1.19.2

ENV DEBIAN_FRONTEND=noninteractive

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
                 git \
                 wget \
                 zlib1g-dev # buildkit

WORKDIR /opt/


# Install samtools
RUN wget https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2 && \
    tar xjf samtools-${SAMTOOLS_VERSION}.tar.bz2 && \
    cd samtools-${SAMTOOLS_VERSION} && ./configure --without-curses --enable-libcurl && make -s all all-htslib && make install install-htslib && cd - && \
    rm -rf samtools-${SAMTOOLS_VERSION}*

RUN git clone https://github.com/Griffan/VerifyBamID.git && cd VerifyBamID && mkdir build && cd build && cmake .. && make && make test 

RUN cp /opt/VerifyBamID/bin/VerifyBamID /usr/local/bin

WORKDIR /

RUN mkdir -p /app/ && echo -e "VerifyBamID=${VBI_VERSION}" > /app/software.list
