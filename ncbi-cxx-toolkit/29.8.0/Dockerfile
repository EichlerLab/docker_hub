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

RUN ./cmake-configure --without-debug

# RUN cd CMake-*/build && \
#     cmake --build . -j4 --verbose && \
#     cmake --install . --prefix ${NCBI_ROOT}

RUN set -eux; \
    cd CMake-*/build; \
    (cmake --build . -j4 --verbose) 2>&1 | tee /tmp/ncbi_build.log; \
    echo "---- LAST 200 LINES ----"; \
    tail -n 200 /tmp/ncbi_build.log; \
    echo "---- ERROR-LIKE LINES ----"; \
    grep -nE "fatal error:|error:|undefined reference|collect2:|ld returned|killed" /tmp/ncbi_build.log | tail -n 80

ENV PATH=${NCBI_ROOT}/bin:${PATH}

ENV LD_LIBRARY_PATH=${NCBI_ROOT}/lib

WORKDIR /app
COPY ./software.list /app/

