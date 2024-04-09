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
    bedtools && \
    yum clean all && \
    rm -rf /var/cache/yum


CMD ["/bin/bash"]
