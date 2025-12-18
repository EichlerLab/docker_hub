FROM continuumio/miniconda3

COPY ./environment.yml /

RUN apt-get update && \
    apt-get full-upgrade -y && \
    apt-get install -y --no-install-recommends \
    wget \
    curl \
    bc \
    unzip \
    bzip2 \
    less \
    gcc \
    jq \
    git \
    build-essential \
    cmake \
    clang \
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

RUN conda env create -f /environment.yml && conda clean -a

ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/conda/envs/truvari/lib/

ENV PATH=/opt/conda/envs/truvari/bin/:${PATH}

RUN echo "source activate truvari" > ~/.bashrc