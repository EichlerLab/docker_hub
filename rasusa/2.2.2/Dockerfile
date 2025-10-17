FROM ubuntu:22.04

LABEL maintainer="YOUNGJUN KWON"

ARG VERSION="2.2.2"

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
                 wget \
                 cargo \
                 git \
                 zlib1g-dev # buildkit


RUN git clone https://github.com/mbhall88/rasusa.git /opt/rasusa
WORKDIR /opt/rasusa
RUN git checkout ${VERSION} && cargo build --release.
ENV PATH=/opt/rasusa/target/release:$PATH
RUN rasusa --help
RUN mkdir -p /app/ && echo -e "rasusa=${VERSION}" > /app/software.list
