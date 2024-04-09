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
    OSID=$(grep "^ID=" /etc/os-release | cut -d"=" -f2 | sed 's/"//g') && \
    OSNAME=$(grep "^PRETTY_NAME=" /etc/os-release | cut -d"=" -f2 | sed 's/"//g') && \
    echo "#OS: ${OSNAME}" > $SOFTWARE_LIST_FILE && \

    APT_INSTALLED_PKGS="autoconf \
    make \
    automake \
    gcc \
    g++ \
    samtools \
    bedtools" && \

    OTHER_PKGS="" && \

    for PKG in $INSTALLED_PKGS;do \
        if [ "${OSID}" = "ubuntu" ] || [ "${OSID}" = "debian" ]; then \
            INSTALLED_VERSION=$(apt-cache policy ${PKG} | grep 'Installed' | awk -F":" '{print $NF}' | cut -d"-" -f1 | cut -d"+" -f1 | sed 's/ //g');\
        elif [ "${OSID}" = "centos" ]; then \
            INSTALLED_VERSION=$(yum list installed | grep "^${PKG}\." | awk '{print $2}' | cut -d"-" -f1 | cut -d"+" -f1); \
        fi; \
        if [ ! -z "${INSTALLED_VERSION}" ]; then \
            echo "${PKG}=${INSTALLED_VERSION}" >> $SOFTWARE_LIST_FILE; \
        fi; \
    done && \

    for PKG_WITH_VERSION in $OTHER_PKGS;do \
        echo "$PKG_WITH_VERSION" >> $SOFTWARE_LIST_FILE; \
    done


CMD ["/bin/bash"]

