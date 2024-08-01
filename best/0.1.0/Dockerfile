FROM ubuntu:22.04

LABEL maintainer="YOUNGJUN KWON"

ARG VERSION="0.1.0"

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

RUN git clone https://github.com/google/best.git /opt/best
WORKDIR /opt/best
RUN cargo install --locked --path .
ENV PATH=/opt/best/target/release:$PATH
RUN best --help
RUN mkdir -p /app/ && echo -e "best=${VERSION}" > /app/software.list