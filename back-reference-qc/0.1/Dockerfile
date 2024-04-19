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
                rm -rf /var/lib/apt/lists/*
# Install yak
RUN git clone https://github.com/lh3/yak /opt/yak
WORKDIR /opt/yak
RUN git checkout "v${YAK_VERSION}" && make
ENV PATH=/opt/yak:$PATH

# Install seqtk
RUN git clone https://github.com/lh3/seqtk.git /opt/seqtk
WORKDIR /opt/seqtk
RUN git checkout "v${SEQTK_VERSION}" && make
ENV PATH=/opt/seqtk:$PATH

# Install kraken2
RUN git clone https://github.com/DerrickWood/kraken2.git /opt/kraken2
WORKDIR /opt/kraken2
RUN git checkout "v${KRAKEN_VERSION}" && ./install_kraken2.sh .
ENV PATH=/opt/kraken2:$PATH


# Install samtools
RUN git clone https://github.com/samtools/samtools.git /opt/samtools
WORKDIR /opt/samtools
RUN git checkout "v${SAMTOOLS_VERSION}" && ./configure && make && make install
ENV PATH=/opt/samtools:$PATH

# Software info recording
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


