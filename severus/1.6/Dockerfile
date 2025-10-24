FROM ubuntu:22.04

#FROM continuumio/miniconda3

#FROM ubuntu:22.04
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
                 xz-utils \
                 zlib1g-dev


RUN wget https://github.com/KolmogorovLab/Severus/archive/refs/tags/1.6.tar.gz && tar -zxvf 1.6.tar.gz 

#conda create -n severus_env severus=1.6 -c bioconda
#conda activate severus_env


