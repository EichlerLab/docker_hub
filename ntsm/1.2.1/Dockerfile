FROM ubuntu:22.04

ARG NTSM_VERSION=1.2.1

LABEL maintainer="YOUNGJUN KWON"

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


## INSTALL ntsm

RUN git clone https://github.com/JustinChu/ntsm.git /opt/ntsm
WORKDIR /opt/ntsm
RUN ./autogen.sh
RUN ./configure && make
ENV PATH=/opt/ntsm:/opt/ntsm/src:$PATH
RUN mkdir -p /app/ && echo -e "ntsm=${NTSM_VERSION}" > /app/software.list
