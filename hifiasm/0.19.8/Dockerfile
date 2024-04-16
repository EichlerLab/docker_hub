FROM ubuntu:22.04

WORKDIR /home

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
WORKDIR /home/hifiasm 
RUN make
ENV PATH /home/hifiasm:$PATH

# Install yak
WORKDIR /home
RUN git clone https://github.com/lh3/yak
WORKDIR /home/yak
RUN make

WORKDIR /home
COPY Dockerfile .
COPY software.list /app/software.list
