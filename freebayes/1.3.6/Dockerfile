FROM ubuntu:22.04

MAINTAINER Eichler Lab

ARG DEBIAN_FRONTEND=noninteractive
ARG SAMTOOLS_VERSION=1.19.2
ARG BCFTOOLS_VERSION=1.19
ARG FREEBAYES_VERSION=1.3.6


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
RUN wget https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2 && \
    tar xjf samtools-${SAMTOOLS_VERSION}.tar.bz2 && \
    cd samtools-${SAMTOOLS_VERSION} && ./configure --without-curses --enable-libcurl && make -s all all-htslib && make install install-htslib && cd - && \
    rm -rf samtools-${SAMTOOLS_VERSION}*

#install bcftools
RUN wget https://github.com/samtools/bcftools/releases/download/${BCFTOOLS_VERSION}/bcftools-${BCFTOOLS_VERSION}.tar.bz2 && \
    tar xjf bcftools-${BCFTOOLS_VERSION}.tar.bz2 && \
    cd bcftools-${BCFTOOLS_VERSION} && ./configure --without-curses && make -s && make install && cd - && \
    rm -rf bcftools-${BCFTOOLS_VERSION}*

RUN wget https://github.com/freebayes/freebayes/releases/download/v${FREEBAYES_VERSION}/freebayes-${FREEBAYES_VERSION}-linux-amd64-static.gz && gunzip freebayes-${FREEBAYES_VERSION}-linux-amd64-static.gz && mv freebayes-${FREEBAYES_VERSION}-linux-amd64-static /usr/bin/freebayes && chmod 755 /usr/bin/freebayes


# Clean up 
RUN apt-get -qqy purge autoconf automake bzip2 gcc make wget && \
    apt-get -qqy clean && \
    rm -rf /tmp/* \
           /var/tmp/* \
           /var/cache/apt/* \
           /var/lib/apt/lists/* \
           /usr/share/man/?? \
           /usr/share/man/??_*

RUN mkdir -p /app/ && echo -e "samtools=${SAMTOOLS_VERSION}\nbcftools=${BCFTOOLS_VERSION}\nfreebayes=${FREEBAYES_VERSION}" > /app/software.list
