FROM ubuntu:22.04

LABEL Youngjun Kwon

ARG RB_VERSION="0.1.24"

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
                 zlib1g-dev # buildkit

RUN wget https://github.com/mrvollger/rustybam/releases/download/v${RB_VERSION}/rustybam_v${RB_VERSION}-x86_64-unknown-linux-musl.tar.gz && \
    mkdir -p /opt/rustybam && \
    tar -xzf rustybam_v${RB_VERSION}-x86_64-unknown-linux-musl.tar.gz -C /opt/rustybam && \
    rm -f rustybam_v${RB_VERSION}-x86_64-unknown-linux-musl.tar.gz

ENV PATH=/opt/rustybam:$PATH

RUN mkdir -p /app/ && echo -e "rustybam=${RB_VERSION}" > /app/software.list

