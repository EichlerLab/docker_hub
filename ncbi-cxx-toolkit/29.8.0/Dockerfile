# syntax=docker/dockerfile:1.4
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV NCBI_VERSION=27.0.0
ENV NCBI_ROOT=/opt/ncbi

RUN apt-get update -o Acquire::Retries=5 && apt-get install -y --no-install-recommends \
    ca-certificates \
    gcc-12 g++-12 \
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
RUN git clone --depth 1 --branch release-${NCBI_VERSION} \
    https://github.com/ncbi/ncbi-cxx-toolkit-public.git ncbi-cxx

WORKDIR /opt/ncbi-cxx
ENV CXXFLAGS="-std=c++14"

RUN ./cmake-configure --without-debug --with-projects="core;app/winmask" && \
    cd CMake-*/build && \
    cmake --build . -j && \
    cmake --install . --prefix "${NCBI_ROOT}"

ENV PATH=${NCBI_ROOT}/bin:${PATH}
ENV LD_LIBRARY_PATH=${NCBI_ROOT}/lib:${NCBI_ROOT}/lib64:${LD_LIBRARY_PATH}

WORKDIR /app
COPY ./software.list /app/

