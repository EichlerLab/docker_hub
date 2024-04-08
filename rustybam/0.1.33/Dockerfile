FROM ubuntu:22.04

MAINTAINER William T Harvey

ARG RB_VERSION="0.1.33"

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
                 zlib1g-dev # buildkit



RUN cargo install --version ${RB_VERSION} rustybam

RUN cp /root/.cargo/bin/* /usr/bin/

#RUN /bin/ls ~/.cargo/bin

RUN rustybam --help && rb --help

