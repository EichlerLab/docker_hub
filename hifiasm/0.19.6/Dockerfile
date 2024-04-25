FROM ubuntu:22.04

WORKDIR /opt

ARG HIFIASM_VERSION=0.19.6

#### Basic image utilities
RUN apt-get update && \
    apt-get full-upgrade -y && \
    apt-get install -y --no-install-recommends \
    wget \
    curl \
    unzip \
    bzip2 \
    less \
    g++ \
    tabix \
    git \
    build-essential \
    vim \
    cmake \
    clang \
    libclang-dev \
    libncurses-dev \
    zlib1g-dev \
    libbz2-dev \
    libssl-dev \
    liblzma-dev \
    make \
    cmake \
    autoconf \
    software-properties-common && \
    apt-get -y clean  && \
    apt-get -y autoclean  && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/*

# Install hifiasm (requiring g++ and zlib)
RUN git clone https://github.com/chhylp123/hifiasm
WORKDIR /opt/hifiasm 
RUN git checkout ${HIFIASM_VERSION} && make
ENV PATH /opt/hifiasm:$PATH

# Install yak
WORKDIR /opt
RUN git clone https://github.com/lh3/yak
WORKDIR /opt/yak
RUN make
ENV PATH /opt/yak:$PATH


WORKDIR /opt
COPY Dockerfile .
COPY software.list /app/software.list
WORKDIR /
