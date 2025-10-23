FROM ubuntu:22.04

WORKDIR /home

#### Basic image utilities
RUN apt-get update && \
    apt-get full-upgrade -y && \
    apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    wget \
    curl \
    bc \
    unzip \
    bzip2 \
    less \
    gcc \
    tabix \
    jq \
    git \
    gpg-agent \
    build-essential \
    vim \
    libhdf5-dev \
    hdf5-tools \
    libcurl4-gnutls-dev \
    software-properties-common && \
    apt-get -y clean  && \
    apt-get -y autoclean  && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/*

# Install R
ARG R_VERSION=4.3.2
ARG OS_IDENTIFIER=ubuntu-2204

RUN wget https://cdn.posit.co/r/${OS_IDENTIFIER}/pkgs/r-${R_VERSION}_1_amd64.deb && \
    apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -f -y ./r-${R_VERSION}_1_amd64.deb && \
    ln -s /opt/R/${R_VERSION}/bin/R /usr/bin/R && \
    ln -s /opt/R/${R_VERSION}/bin/Rscript /usr/bin/Rscript && \
    ln -s /opt/R/${R_VERSION}/lib/R /usr/lib/R && \
    rm r-${R_VERSION}_1_amd64.deb && \
    rm -rf /var/lib/apt/lists/*

RUN R -e "install.packages('versions', dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "versions::install.versions('ggplot2', '3.4.4')"
RUN R -e "versions::install.versions('BiocManager', '1.30.22')"
RUN R -e "versions::install.versions('ampir', '1.0.0')"
RUN R -e "versions::install.versions('dplyr', '1.1.3')"
RUN R -e "versions::install.versions('tidyr', '1.3.0')"
RUN R -e "versions::install.versions('stringr', '1.5.1')"
RUN R -e "BiocManager::install('Biostrings')"

COPY Dockerfile .
