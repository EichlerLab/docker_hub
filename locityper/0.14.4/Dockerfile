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
    libclang-dev \
    libncurses-dev \
    zlib1g-dev \
    libbz2-dev \
    libssl-dev \
    liblzma-dev \
    make \
    cmake \
    autoconf \
    jellyfish \
    software-properties-common && \
    apt-get -y clean  && \
    apt-get -y autoclean  && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/*

# Install Rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH /root/.cargo/env:$PATH

# Install htslib
WORKDIR /opt/htslib
RUN wget https://github.com/samtools/htslib/releases/download/1.19.1/htslib-1.19.1.tar.bz2 && \
    tar -xvf htslib-1.19.1.tar.bz2 && \   
    rm -rf htslib-1.19.1.tar.bz2
WORKDIR /opt/htslib/htslib-1.19.1 
RUN ./configure && \
    make 

# Install samtools
WORKDIR /opt/samtools
RUN wget https://github.com/samtools/samtools/releases/download/1.19.2/samtools-1.19.2.tar.bz2 && \
    tar -xvf samtools-1.19.2.tar.bz2 && \
    rm -rf samtools-1.19.2.tar.bz2
WORKDIR /opt/samtools/samtools-1.19.2
RUN ./configure --with-htslib=/opt/htslib/htslib-1.19.1 && \
    make && \
    make install && \
    mkdir -p /home/cache
RUN wget https://storage.googleapis.com/gcp-public-data--broad-references/hg38/v0/Homo_sapiens_assembly38.ref_cache.tar.gz
RUN tar -xzf Homo_sapiens_assembly38.ref_cache.tar.gz
ENV REF_PATH="/opt/samtools/samtools-1.19.2/ref/cache/%2s/%2s/%s:http://www.ebi.ac.uk/ena/cram/md5/%s"
ENV REF_CACHE="/opt/samtools/samtools-1.19.2/ref/cache/%2s/%2s/%s"


# Install minimap2
WORKDIR /home
RUN wget https://github.com/lh3/minimap2/releases/download/v2.28/minimap2-2.28_x64-linux.tar.bz2 && \
    tar -xvf minimap2-2.28_x64-linux.tar.bz2 && \
    rm -rf minimap2-2.28_x64-linux.tar.bz2
ENV PATH /home/minimap2-2.28_x64-linux:$PATH

# Install strobealign
RUN wget https://github.com/ksahlin/strobealign/archive/refs/tags/v0.13.0.tar.gz && \
    tar -zxvf  v0.13.0.tar.gz && \
    rm -rf v0.13.0.tar.gz
WORKDIR /home/strobealign-0.13.0
RUN cmake -B build -DCMAKE_C_FLAGS="-msse4.2" -DCMAKE_CXX_FLAGS="-msse4.2" && \
    make -j -C build
ENV PATH /home/strobealign-0.13.0/build:$PATH
WORKDIR /home

# Install locityper
RUN git clone https://github.com/tprodanov/locityper
WORKDIR /home/locityper
RUN git clone https://github.com/smarco/WFA2-lib WFA2
RUN /root/.cargo/bin/cargo build --release && \
    /root/.cargo/bin/cargo install --path .




WORKDIR /home
COPY Dockerfile .
COPY software.list /app/software.list
