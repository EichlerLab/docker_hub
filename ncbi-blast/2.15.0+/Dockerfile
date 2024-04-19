FROM ubuntu:22.04

MAINTAINER William T Harvey

ARG BLAST_VERSION=2.15.0+

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
                 gcc \
                 g++ \
                 make \
                 wget \
                 zlib1g-dev # buildkit


RUN wget --no-check-certificate https://ftp.ncbi.nlm.nih.gov/blast/executables/LATEST/ncbi-blast-${BLAST_VERSION}-x64-linux.tar.gz && \
    tar zxvf ncbi-blast-${BLAST_VERSION}-x64-linux.tar.gz && cd ncbi-blast-${BLAST_VERSION} && cp -rl ./bin /usr/

RUN echo -e "ncbi-blast=${BLAST_VERSION}" > /app/software.list


