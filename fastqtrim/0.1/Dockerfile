FROM ubuntu:22.04

ARG FASTPLONG_VERSION=0.2.2
ARG SAMTOOLS_VERSION=1.20

LABEL maintainer="Youngjun Kwon"

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
                rsync \
                xz-utils \
                zlib1g-dev && \
                rm -rf /var/lib/apt/lists/*
# Install fastplong
RUN git clone https://github.com/OpenGene/fastplong.git /opt/fastplong
WORKDIR /opt/fastplong
RUN git checkout "v${FASTPLONG_VERSION}" && make -j && make install
ENV PATH=/opt/fastplong:$PATH
RUN fastplong

# Install samtools
WORKDIR /opt/samtools
RUN wget https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2 && \
    tar -xjf samtools-${SAMTOOLS_VERSION}.tar.bz2 --strip-components=1 && \
    rm samtools-${SAMTOOLS_VERSION}.tar.bz2 && \
    ./configure && make && make install
ENV PATH=/opt/samtools:$PATH
RUN samtools

# Software info recording
RUN mkdir -p /app && \
    SOFTWARE_LIST_FILE="/app/software.list" && \
    touch $SOFTWARE_LIST_FILE && \
    OSID=$(grep "^ID=" /etc/os-release | cut -d"=" -f2 | sed 's/"//g') && \
    # space-separated names of software installed by the package management system.
    SOFTWARE_FROM_PKG="" && \
    # space-separated names of software and versions installed manually.
    SOFTWARE_VERSION_MANUAL="fastplong=${FASTPLONG_VERSION} \
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


