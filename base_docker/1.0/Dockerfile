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

    mkdir -p /app
    SOFTWARE_LIST_FILE="/app/software.list"
    touch $SOFTWARE_LIST_FILE

# To list the software installed via apt to be specified in the software.list file.
##########################################
    apt_installed_pkgs="
    autoconf \
    automake \
    gcc \
    g++ \
    make \
    samtools \
    bedtools \
    "
# Manually specify the software not installed via apt in the software.list file.
# format: {software}={version}. e.g. samtools=1.19
##########################################
    other_pkgs="
    test=1.0.0 \
    test2=1.0.1 \
    "
    
##########################################
    for apt_pkg in $apt_installed_pkgs;do
        installed_version=$(apt-cache policy ${apt_pkg} | grep 'Installed' | cut -d":" -f2 | cut -d"-" -f1 | sed 's/ //g')
        if [ ! -z "${installed_version}"];then
            echo "${apt_pkg}=${installed_version}" >> $SOFTWARE_LIST_FILE
        fi
    done

    for pkg_with_version in $other_pkgs;do
        echo "$pkg_with_version" >> $SOFTWARE_LIST_FILE
    done

CMD ["/bin/bash"]

