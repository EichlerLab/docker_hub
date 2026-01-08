FROM ubuntu:22.04

LABEL maintainer="Eichler Lab"

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    build-essential \
    g++ \
    make \
    git \
    libboost-all-dev \
    samtools \
    parallel \
 && update-ca-certificates \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/sedef

# build
RUN git clone https://github.com/vpc-ccg/sedef.git . \
 && make -j"$(nproc)" release CXX=g++

ENV PATH="/opt/sedef:${PATH}"

WORKDIR /app
COPY ./software.list /app/
