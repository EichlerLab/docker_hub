FROM centos:7

MAINTAINER William T Harvey

ARG MANTA_VERSION="1.6.0"

# Default build libraries
RUN yum -y update && \
   yum -y install centos-release-scl && \
   yum -y install devtoolset-10 \
                ca-certificates \
                bzip2-devel \
                libcurl-devel \
                xz-devel \
                libncurses5-dev \
                autoconf \
                automake \
                make \
                gcc \
                gcc-c++ \
                libstdc++-static \
                cmake \
                bzip2 \
                devtoolse \
                make \
                wget \
                git \
                boost-devel \
                zlib-devel # buildkit

WORKDIR /opt/

RUN wget https://github.com/Illumina/manta/releases/download/v${MANTA_VERSION}/manta-${MANTA_VERSION}.release_src.tar.bz2 && tar xvf manta-${MANTA_VERSION}.release_src.tar.bz2 && cd manta-${MANTA_VERSION}.release_src && mkdir -p build && cd build && ../configure && make && make install

WORKDIR /

# ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/lib"

RUN mkdir -p /app/ && echo -e "manta=${MANTA_VERSION}" > /app/software.list