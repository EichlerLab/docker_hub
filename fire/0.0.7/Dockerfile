FROM continuumio/miniconda3

USER root

ARG FIRE_VERSION=v0.0.7

RUN apt-get update && \
    apt-get full-upgrade -y && \
    apt-get install -y --no-install-recommends \
    wget \
    less \
    curl \
    bc \
    unzip \
    bzip2 \
    less \
    gcc \
    jq \
    git \
    gpg-agent \
    build-essential \
    libclang-dev \
    libncurses-dev \
    zlib1g-dev \
    libbz2-dev \
    libssl-dev \
    liblzma-dev \
    libcurl4-openssl-dev \
    vim \
    software-properties-common && \
    apt-get -y clean  && \
    apt-get -y autoclean  && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/*

RUN conda create -c conda-forge -c bioconda -n snakemake 'snakemake>=8.4'

WORKDIR /opt/
RUN git clone https://github.com/fiberseq/FIRE.git
WORKDIR /opt/FIRE 
RUN git checkout ${FIRE_VERSION}

RUN mkdir /opt/fire

ENV PATH="/opt/conda/envs/snakemake/bin:/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/fire"

RUN echo "#!/bin/bash\nmkdir -p \${HOME}/fire_env;\nexport SNAKEMAKE_CONDA_PREFIX=\${HOME}/fire_env;\nexport TMP=\${HOME}/fire_env;\nexport TEMPDIR=\${HOME}/fire_env;\nexport TEMP=\${HOME}/fire_env;\nexport APPTAINER_CACHEDIR=\${HOME}/fire_env;\nexport PATH='/opt/conda/envs/snakemake/bin:/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/fire:/opt/FIRE';\nconda activate /opt/conda/envs/snakemake/" > /opt/fire/load_fire.sh

RUN chmod +x /opt/fire/load_fire.sh

ENTRYPOINT [". /opt/fire/load_fire.sh"]

COPY Dockerfile .