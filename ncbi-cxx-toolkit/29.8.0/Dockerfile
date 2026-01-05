FROM ubuntu:22.04

LABEL Maintanier="Eichler Lab"

ENV DEBIAN_FRONTEND=noninteractive
ENV NCBI_VERSION=29.8.0
ENV NCBI_ROOT=/opt/ncbi

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    perl \
    python3 \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    libssl-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    uuid-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN git clone --depth 1 \
    --branch release/${NCBI_VERSION} \
    https://github.com/ncbi/ncbi-cxx-toolkit-public.git ncbi-cxx


WORKDIR /opt/ncbi-cxx

RUN mkdir build && cd build && \
    cmake .. \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=${NCBI_ROOT} \
      -DBUILD_SHARED_LIBS=ON \
      -DCMAKE_CXX_STANDARD=17 \
      -DNCBI_PTBCFG_ENABLE_BLAST=ON \
      -DNCBI_PTBCFG_ENABLE_SRA=ON \
      -DNCBI_PTBCFG_ENABLE_CONN=ON \
      -DNCBI_PTBCFG_ENABLE_APP=ON && \
    make -j$(nproc) && \
    make install

ENV PATH=${NCBI_ROOT}/bin:${PATH}
ENV LD_LIBRARY_PATH=${NCBI_ROOT}/lib:${LD_LIBRARY_PATH}


WORKDIR /app
COPY ./software.list /app/

