FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ARG YAK_VERSION=0.1
ARG SEQTK_VERSION=1.4
ARG KRAKEN_VERSION=2.1.3
ARG SAMTOOLS_VERSION=1.20

LABEL Youngjun Kwon

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
                git \
                make \
                wget \
                xz-utils \
                zlib1g-dev && \
    # yak
    wget https://github.com/lh3/yak/archive/refs/tags/v${YAK_VERSION}.tar.gz && \
    mkdir -p /yak; tar -xzf v${YAK_VERSION}.tar.gz -C /yak --strip-component=1 && cd /yak ; \
    make && cd / && \
    rm -f ./v${YAK_VERSION}.tar.gz && \
    # seqtk
    wget https://github.com/lh3/seqtk/archive/refs/tags/v${SEQTK_VERSION}.tar.gz && \
    mkdir -p /seqtk; tar -xzf v${SEQTK_VERSION}.tar.gz -C /seqtk --strip-component=1 && cd /seqtk ; \
    make && cd / && \
    rm -f ./v${SEQTK_VERSION}.tar.gz && \
    # kraken2
    wget https://github.com/DerrickWood/kraken2/archive/refs/tags/v${KRAKEN_VERSION}.tar.gz && \
    mkdir -p /kraken2; tar -xzf v${KRAKEN_VERSION}.tar.gz -C /kraken2 --strip-component=1 && cd /kraken2 ; \
    ./install_kraken2.sh /usr/bin/ && cd / && \
    rm -f ./v${KRAKEN_VERSION}.tar.gz && \
    # samtools
    wget https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2 && \
    mkdir -p /samtools; tar -xjf samtools-${SAMTOOLS_VERSION}.tar.bz2 -C /samtools --strip-component=1 && cd /samtools ; \
    ./configure && make && make install && cd / && \
    rm -f ./v${SAMTOOLS_VERSION}.tar.bz2 

ENV PATH=/samtools:/kraken2:/seqtk:/yak:${PATH}

RUN mkdir -p /app && \
    SOFTWARE_LIST_FILE="/app/software.list" && \
    touch $SOFTWARE_LIST_FILE && \
    OSID=$(grep "^ID=" /etc/os-release | cut -d"=" -f2 | sed 's/"//g') && \
    # space-separated names of software installed by the package management system.
    SOFTWARE_FROM_PKG="" && \
    # space-separated names of software and versions installed manually.
    SOFTWARE_VERSION_MANUAL="yak=${YAK_VERSION} \
                            seqtk=${SEQTK_VERSION} \
                            kraken2=${KRAKEN_VERSION} \
                            samtools=${SAMTOOLS_VERSION}" && \
    # Recording the names of software and versions into the file /app/software.list .
    for SOFTWARE_PKG in $SOFTWARE_FROM_PKG; do \
        if [ "${OSID}" = "ubuntu" ] || [ "${OSID}" = "debian" ]; then \
            INSTALLED_VERSION=$(apt-cache policy ${SOFTWARE_PKG} | grep 'Installed' | awk -F":" '{print $NF}' | cut -d"-" -f1 | cut -d"+" -f1 | sed 's/ //g'); \
        elif [ "${OSID}" = "centos" ]; then \
            INSTALLED_VERSION=$(yum list installed | grep "^${SOFTWARE_PKG}\." | awk '{print $2}' | awk -F":" '{print $NF}' | cut -d"-" -f1 | cut -d"+" -f1); \
        fi; \
        if [ ! -z "${INSTALLED_VERSION}" ]; then \
            echo "${SOFTWARE_PKG}=${INSTALLED_VERSION}" >> $SOFTWARE_LIST_FILE; \
        fi; \
    done && \
    for SOFTWARE_INFO in $SOFTWARE_VERSION_MANUAL;do \
        echo "$SOFTWARE_INFO" >> $SOFTWARE_LIST_FILE; \
    done


