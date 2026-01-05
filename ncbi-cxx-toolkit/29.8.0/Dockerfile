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
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN git clone --depth 1 \
    --branch release/${NCBI_VERSION} \
    https://github.com/ncbi/ncbi-cxx-toolkit-public.git ncbi-cxx

WORKDIR /opt/ncbi-cxx

# 1) NCBI 권장 configure 스크립트로 빌드 트리 생성
RUN ./cmake-configure \
      --without-debug \
      --prefix=${NCBI_ROOT}

# 2) 생성된 빌드 디렉토리(CMake-*)에서 빌드/설치
RUN cd CMake-* && \
    cmake --build . -j$(nproc) && \
    cmake --install .

ENV PATH=${NCBI_ROOT}/bin:${PATH}
# BuildKit 경고 피하려고 기존 LD_LIBRARY_PATH 이어붙이기 대신 고정
ENV LD_LIBRARY_PATH=${NCBI_ROOT}/lib

WORKDIR /app
COPY ./software.list /app/

