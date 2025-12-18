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

ARG R_VERSION=4.5.1
ARG OS_IDENTIFIER=debian-12

RUN wget https://cdn.posit.co/r/${OS_IDENTIFIER}/pkgs/r-${R_VERSION}_1_amd64.deb && \
    apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -f -y ./r-${R_VERSION}_1_amd64.deb && \
    ln -s /opt/R/${R_VERSION}/bin/R /usr/bin/R && \
    ln -s /opt/R/${R_VERSION}/bin/Rscript /usr/bin/Rscript && \
    ln -s /opt/R/${R_VERSION}/lib/R /usr/lib/R && \
    rm r-${R_VERSION}_1_amd64.deb && \
    rm -rf /var/lib/apt/lists/*

RUN R -e "install.packages('data.table',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('stringr',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('magrittr',dependencies=TRUE, repos='http://cran.rstudio.com/')"

RUN conda env create -f /environment.yml && conda clean -a

ENV PATH=/opt/conda/envs/truvari/bin/:${PATH}

COPY my_libraries.R /

RUN echo "source activate truvari" > ~/.bashrc