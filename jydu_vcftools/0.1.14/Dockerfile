FROM ubuntu:22.04

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
                git \
                make \
                wget \
                rsync \
                xz-utils \
                zlib1g-dev && \
                rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/vcftools/vcftools.git /opt/vcftools
WORKDIR /opt/vcftools
RUN cd /opt/vcftools
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install
ENV PATH=/opt/vcftools:$PATH

