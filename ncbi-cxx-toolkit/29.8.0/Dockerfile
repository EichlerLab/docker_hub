FROM ubuntu:22.04

LABEL maintainer="Eichler Lab"

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
    bash \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN git clone --depth 1 \
    --branch release/${NCBI_VERSION} \
    https://github.com/ncbi/ncbi-cxx-toolkit-public.git ncbi-cxx

WORKDIR /opt/ncbi-cxx

RUN ./cmake-configure --without-debug

RUN bash -lc 'set -euo pipefail; \
  cd CMake-*/build; \
  cmake -S /opt/ncbi-cxx/src -B . \
    -DCMAKE_BUILD_TYPE=Release \
    -DNCBI_PTBCFG_ENABLE_TESTS=OFF \
    -DNCBI_COMPONENT_DBAPI=OFF \
    -DNCBI_COMPONENT_ftds14=OFF \
    -DNCBI_COMPONENT_ODBC=OFF'

RUN bash -lc 'set -euo pipefail; \
  cd CMake-*/build; \
  cmake --build . -j1'

RUN bash -lc 'set -euo pipefail; \
  cd CMake-*/build; \
  cmake --install . --prefix '"${NCBI_ROOT}"''

ENV PATH=${NCBI_ROOT}/bin:${PATH}

ENV LD_LIBRARY_PATH=${NCBI_ROOT}/lib:${NCBI_ROOT}/lib64

WORKDIR /app
COPY ./software.list /app/
