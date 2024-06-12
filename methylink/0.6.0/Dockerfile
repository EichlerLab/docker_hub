FROM ubuntu:22.04
FROM continuumio/miniconda3

ARG METHYLINK_VERSION=0.6.0

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
    git /
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install htslib
WORKDIR /opt/htslib
RUN wget https://github.com/samtools/htslib/releases/download/1.19.1/htslib-1.19.1.tar.bz2 && \
    tar -xvf htslib-1.19.1.tar.bz2 && \
    rm -rf htslib-1.19.1.tar.bz2
WORKDIR /opt/htslib/htslib-1.19.1 
RUN ./configure --enable-libcurl && \
    make 

# Install methylink
WORKDIR /home
RUN pip install methylink==$METHYLINK_VERSION

