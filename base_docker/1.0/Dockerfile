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

RUN mkdir -p /app && \
    SOFTWARE_LIST_FILE="/app/software.list" && \
    touch $SOFTWARE_LIST_FILE && \

    APT_INSTALLED_PKGS="autoconf \
    automake \
    gcc \
    g++ \
    make \
    samtools \
    bedtools" && \

    for APT_PKG in $APT_INSTALLED_PKGS;do \
        INSTALLED_VERSION=$(apt-cache policy ${APT_PKG} | grep 'Installed' | awk -F":" '{print $NF}' | cut -d"-" -f1 | sed 's/ //g');\
        if [ ! -z "${INSTALLED_VERSION}" ];then \
            echo "${APT_PKG}=${INSTALLED_VERSION}" >> $SOFTWARE_LIST_FILE; \
        fi; \
    done && \

    OTHER_PKGS="test=1.0.0 \
    test2=1.0.1" && \

    for PKG_WITH_VERSION in $OTHER_PKGS;do \
        echo "$PKG_WITH_VERSION" >> $SOFTWARE_LIST_FILE; \
    done

CMD ["/bin/bash"]

