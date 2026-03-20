FROM ubuntu:22.04

LABEL maintainer="Eichler Lab"

RUN apt-get update && apt-get install -y --no-install-recommends \
    locales \
    ca-certificates \
    build-essential \
    g++ \
    make \
    git \
    libboost-all-dev \
    samtools \
    parallel \
    python3 \
    python3-pip \
    python-is-python3 \
    time \
    bc \
 && locale-gen en_US.UTF-8
 && update-ca-certificates \
 && rm -rf /var/lib/apt/lists/*

ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

WORKDIR /opt/sedef

# build
RUN git clone https://github.com/vpc-ccg/sedef.git . \
 && make -j"$(nproc)" release CXX=g++

ENV PATH="/opt/sedef:${PATH}"

WORKDIR /app
COPY ./software.list /app/

