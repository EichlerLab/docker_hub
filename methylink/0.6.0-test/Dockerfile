FROM continuumio/miniconda3

ARG METHYLINK_VERSION=0.6.0

# Default build libraries
RUN apt-get -qqy update --fix-missing && \
    apt-get -qqy dist-upgrade && \
    apt-get -qqy install --no-install-recommends \
    ca-certificates \
    libbz2-dev \
    libcurl4-openssl-dev \
    liblzma-dev \
    libncurses5-dev \
    autoconf \
    automake \
    bzip2 \
    gcc \
    g++ \
    make \
    wget \
    zlib1g-dev \
    git \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install htslib
WORKDIR /opt/htslib
RUN wget --tries=5  https://github.com/samtools/htslib/releases/download/1.19.1/htslib-1.19.1.tar.bz2 && \
    tar -xvf htslib-1.19.1.tar.bz2 && \
    rm -rf htslib-1.19.1.tar.bz2
WORKDIR /opt/htslib/htslib-1.19.1 
RUN ./configure --enable-libcurl && \
    make && \
    make install

ENV PATH /opt/htslib/htslib-1.19.1/bin:$PATH

# Install methylink
WORKDIR /home
RUN pip install methylink==$METHYLINK_VERSION

# Patch append_mod_tags.py
COPY patch/append_mod_tags.py /opt/conda/lib/python3.12/site-packages/methylink/append_mod_tags.py

# Generate software list
COPY software.list /app/
