FROM ubuntu:22.04

LABEL maintainer="YOUNGJUN KWON"

ARG VERSION="2.2.2"

# Default build libraries
RUN apt-get -qqy update --fix-missing && \
    apt-get -qqy dist-upgrade && \
    apt-get -qqy install --no-install-recommends  \
                 ca-certificates \
                 curl \
                 build-essential \
                 pkg-config \
                 libssl-dev \
                 git

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain 1.81.0
ENV PATH=/root/.cargo/bin:$PATH

RUN git clone https://github.com/mbhall88/rasusa.git /opt/rasusa
WORKDIR /opt/rasusa
RUN git checkout ${VERSION} && cargo build --release
ENV PATH=/opt/rasusa/target/release:$PATH
RUN rasusa --help
RUN mkdir -p /app/ && echo -e "rasusa=${VERSION}" > /app/software.list
