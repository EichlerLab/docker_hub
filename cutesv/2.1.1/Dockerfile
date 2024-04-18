FROM ubuntu:22.04

WORKDIR /home

#### Basic image utilities
RUN apt-get update && \
    apt-get full-upgrade -y && \
    apt-get install -y --no-install-recommends \
    wget \
    curl \
    bc \
    unzip \
    bzip2 \
    less \
    g++ \
    tabix \
    jq \
    git \
    build-essential \
    vim \
    cmake \
    clang \
    python3 \
    python3-pip \
    libclang-dev \
    libncurses-dev \
    zlib1g-dev \
    libbz2-dev \
    libssl-dev \
    liblzma-dev \
    libcurl4-openssl-dev \
    make \
    cmake \
    autoconf \
    software-properties-common && \
    apt-get -y clean  && \
    apt-get -y autoclean  && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/*

RUN pip install cuteSV==2.1.1 \
    pysam==0.22.0 \
    psutil==5.9.8 \
    scipy==1.13.0 \
    Biopython==1.83 \
    cigar==0.1.3 \
    numpy==1.26.4 \
    pyvcf3==1.0.3 \
    scikit-learn==1.4.2



WORKDIR /home
COPY Dockerfile .
COPY software.list /app/software.list
