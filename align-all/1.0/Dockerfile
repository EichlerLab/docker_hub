FROM ubuntu:22.04

WORKDIR /home

#### Basic image utilities
RUN apt-get update && \
    apt-get full-upgrade -y && \
    apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
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
    jellyfish \
    software-properties-common && \
    apt-get -y clean  && \
    apt-get -y autoclean  && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/*

# Install htslib
WORKDIR /opt/htslib
RUN wget https://github.com/samtools/htslib/releases/download/1.19.1/htslib-1.19.1.tar.bz2 && \
    tar -xvf htslib-1.19.1.tar.bz2 && \   
    rm -rf htslib-1.19.1.tar.bz2
WORKDIR /opt/htslib/htslib-1.19.1 
RUN ./configure --enable-libcurl && \
    make 

# Install samtools
WORKDIR /opt/samtools
RUN wget https://github.com/samtools/samtools/releases/download/1.19.2/samtools-1.19.2.tar.bz2 && \
    tar -xvf samtools-1.19.2.tar.bz2 && \
    rm -rf samtools-1.19.2.tar.bz2
WORKDIR /opt/samtools/samtools-1.19.2
RUN ./configure --with-htslib=/opt/htslib/htslib-1.19.1 --enable-libcurl && \
    make && \
    make install 

# Install BWA
WORKDIR /home
RUN wget  https://github.com/lh3/bwa/releases/download/v0.7.17/bwa-0.7.17.tar.bz2 && \
    tar -xvf bwa-0.7.17.tar.bz2 && \
    rm -rf bwa-0.7.17.tar.bz2 && \
    ln -s /home/bwa-0.7.17/bwakit/run-bwamem /home/bwa-0.7.17/bwakit/bwa
ENV PATH /home/bwa-0.7.17/bwakit/:$PATH

# Install sambamba
WORKDIR /home
RUN wget https://github.com/biod/sambamba/releases/download/v1.0.1/sambamba-1.0.1-linux-amd64-static.gz && \
    gunzip sambamba-1.0.1-linux-amd64-static.gz && \
    chmod a+x sambamba-1.0.1-linux-amd64-static && \
    ln -s /home/sambamba-1.0.1-linux-amd64-static sambamba


# Install minimap2
WORKDIR /home
RUN wget https://github.com/lh3/minimap2/releases/download/v2.28/minimap2-2.28_x64-linux.tar.bz2 && \
    tar -xvf minimap2-2.28_x64-linux.tar.bz2 && \
    rm -rf minimap2-2.28_x64-linux.tar.bz2
ENV PATH /home/minimap2-2.28_x64-linux:$PATH

# Install pbmm2
WORKDIR /home
RUN wget https://github.com/PacificBiosciences/pbmm2/releases/download/v1.13.1/pbmm2 && \
    chmod a+x pbmm2



ENV PATH /home/:$PATH
COPY Dockerfile .
COPY software.list /app/software.list
