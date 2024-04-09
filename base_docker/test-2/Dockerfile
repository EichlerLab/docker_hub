FROM ubuntu:latest


RUN apt-get -qqy update --fix-missing && \
    apt-get -qqy dist-upgrade && \
    apt-get -qqy install --no-install-recommends ca-certificates \
    libbz2-dev \
    libcurl4-openssl-dev \
    liblzma-dev \
    libncurses5-dev \
    autoconf \
    automake \
    bzip2 \
    gcc \
    g++  \
    make \
    wget \
    zlib1g-dev \
    samtools \
    bedtools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]

