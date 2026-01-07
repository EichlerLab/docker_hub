# syntax=docker/dockerfile:1.4
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV NCBI_VERSION=29.8.0
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

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 100 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-12 100 && \
    gcc --version && g++ --version

WORKDIR /opt
RUN git clone --depth 1 --branch release/${NCBI_VERSION} \
    https://github.com/ncbi/ncbi-cxx-toolkit-public.git ncbi-cxx

WORKDIR /opt/ncbi-cxx
ENV CC=gcc
ENV CXX=g++
ENV CXXFLAGS="-fcoroutines"


RUN ./cmake-configure --without-debug --with-projects=corelib && \
    cd CMake-*/build && \
    cmake --build . -j && \
    cmake --install . --prefix "${NCBI_ROOT}"

ENV PATH=${NCBI_ROOT}/bin:${PATH}
ENV LD_LIBRARY_PATH=${NCBI_ROOT}/lib:${NCBI_ROOT}/lib64:${LD_LIBRARY_PATH}

WORKDIR /app
COPY ./software.list /app/

