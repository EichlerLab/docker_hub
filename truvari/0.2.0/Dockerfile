FROM  us.gcr.io/broad-dsp-gcr-public/terra-jupyter-python:latest

LABEL version="0.2.1"

ARG SAMTOOLS_VER=1.22

ARG PREFIX=/usr/local

USER root

ENV PIP_USER=false

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget \
    curl \
    bc \
    gnupg \
    parallel \
    unzip \
    bzip2 \
    less \
    gcc \
    jq \
    git \
    build-essential \
    cmake \
    clang \
    g++ \
    ca-certificates \
    bedtools \
    libclang-dev \
    libncurses-dev \
    zlib1g-dev \
    libbz2-dev \
    libssl-dev \
    liblzma-dev \
    libcurl4-openssl-dev \
    make \
    cmake \
    vim \
    software-properties-common && \
    apt-get -y clean  && \
    apt-get -y autoclean  && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/*

  
ENV HTSLIB_CONFIGURE_OPTIONS="--enable-gcs"

RUN pip3 -V \
  && pip3 install --upgrade pip \
  && pip3 install --upgrade Truvari

RUN mkdir -p /repos &&  cd /repos \
    &&  curl -L https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VER}/samtools-${SAMTOOLS_VER}.tar.bz2 | \
        tar --no-same-owner -jxvf - \
    &&  cd /repos/samtools-${SAMTOOLS_VER} \
    &&  ./configure --enable-libcurl \
    &&  make \
    &&  make install prefix=${PREFIX}

ENV USER=jupyter
USER $USER
# We want pip to install into the user's dir when the notebook is running.
ENV PIP_USER=true
# Enable Intel oneDNN optimizatoin by default
ENV TF_ENABLE_ONEDNN_OPTS=1

# # Note: this entrypoint is provided for running Jupyter independently of Leonardo.
# # When Leonardo deploys this image onto a cluster, the entrypoint is overwritten to enable
# # additional setup inside the container before execution.  Jupyter execution occurs when the
# # init-actions.sh script uses 'docker exec' to call run-jupyter.sh.
ENTRYPOINT ["/opt/conda/bin/jupyter", "notebook"]