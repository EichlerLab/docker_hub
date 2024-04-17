FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive


COPY ./install_packages.R /

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


RUN apt-get -qqy update --fix-missing && \
    apt-get -qqy dist-upgrade && \
    apt-get -qqy install r-base r-base-dev default-jre

RUN Rscript ./install_packages.R


