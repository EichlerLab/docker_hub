FROM continuumio/miniconda3

ARG METHYLINK_VERSION=0.6.0

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget \
    curl \
    git \
    build-essential \
    zlib1g-dev \
    libcurl4-openssl-dev \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install htslib
WORKDIR /opt/htslib
RUN wget https://github.com/samtools/htslib/releases/download/1.19.1/htslib-1.19.1.tar.bz2 && \
    tar -xvf htslib-1.19.1.tar.bz2 && \
    rm -rf htslib-1.19.1.tar.bz2
WORKDIR /opt/htslib/htslib-1.19.1 
RUN ./configure --enable-libcurl && \
    make 

# Install methylink
WORKDIR /home
RUN pip install methylink==$METHYLINK_VERSION

ENV PATH /home/:$PATH

