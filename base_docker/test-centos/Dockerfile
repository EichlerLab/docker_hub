FROM centos:7

RUN yum -y update && \
    yum -y install epel-release && \
    yum -y groupinstall 'Development Tools' && \
    yum -y install ca-certificates \
    bzip2-devel \
    libcurl-devel \
    xz-devel \
    ncurses-devel \
    autoconf \
    automake \
    bzip2 \
    gcc \
    gcc-c++ \
    make \
    wget \
    zlib-devel \
    samtools \
    BEDTools && \
    yum clean all && \
    rm -rf /var/cache/yum


RUN mkdir -p /app && \
    SOFTWARE_LIST_FILE="/app/software.list" && \
    touch $SOFTWARE_LIST_FILE && \
    OSID=$(grep "^ID=" /etc/os-release | cut -d"=" -f2 | sed 's/"//g') && \

    INSTALLED_PKGS="autoconf \
    make \
    automake \
    gcc \
    gcc-c++ \
    samtools \
    BEDTools" && \

    OTHER_PKGS="" && \

    for PKG in $INSTALLED_PKGS;do \
        if [ "${OSID}" = "ubuntu" ] || [ "${OSID}" = "debian" ]; then \
            INSTALLED_VERSION=$(apt-cache policy ${PKG} | grep 'Installed' | awk -F":" '{print $NF}' | cut -d"-" -f1 | cut -d"+" -f1 | sed 's/ //g');\
        elif [ "${OSID}" = "centos" ]; then \
            INSTALLED_VERSION=$(yum list installed | grep "^${PKG}\." | awk '{print $2}' | awk -F":" '{print $NF}' | cut -d"-" -f1 | cut -d"+" -f1);\
        fi; \
        if [ ! -z "${INSTALLED_VERSION}" ]; then \
            echo "${PKG}=${INSTALLED_VERSION}" >> $SOFTWARE_LIST_FILE; \
        fi; \
    done && \

    for PKG_WITH_VERSION in $OTHER_PKGS;do \
        echo "$PKG_WITH_VERSION" >> $SOFTWARE_LIST_FILE; \
    done


CMD ["/bin/bash"]
