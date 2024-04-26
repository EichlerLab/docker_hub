FROM continuumio/miniconda3

MAINTAINER Eichler Lab

ARG DEBIAN_FRONTEND=noninteractive
ARG SAMTOOLS_VERSION=1.19.2
ARG BCFTOOLS_VERSION=1.19
ARG GATK_VERSION=4.3.0.0


COPY ./environment.yml /

RUN conda env create -f /environment.yml && conda clean -a

ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/conda/envs/gatk/lib/

ENV PATH=/opt/conda/envs/gatk/bin/:${PATH}

RUN echo "source activate gatk" > ~/.bashrc

# Default build libraries
RUN apt-get -qqy update --fix-missing && \
    apt-get -qqy dist-upgrade && \
    apt-get -qqy install --no-install-recommends \
                 ca-certificates \
                 libbz2-dev \
                 unzip \
                 libcurl4-openssl-dev \
                 liblzma-dev \
                 libncurses5-dev \
                 autoconf \
                 automake \
                 bzip2 \
                 gcc \
                 python3 \
                 g++ \
                 make \
                 wget \
                 zlib1g-dev \
                 git \
                 default-jre 

# Install samtools
RUN wget https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2 && \
    tar xjf samtools-${SAMTOOLS_VERSION}.tar.bz2 && \
    cd samtools-${SAMTOOLS_VERSION} && ./configure --without-curses --enable-libcurl && make -s all all-htslib && make install install-htslib && cd - && \
    rm -rf samtools-${SAMTOOLS_VERSION}*

#install bcftools
RUN wget https://github.com/samtools/bcftools/releases/download/${BCFTOOLS_VERSION}/bcftools-${BCFTOOLS_VERSION}.tar.bz2 && \
    tar xjf bcftools-${BCFTOOLS_VERSION}.tar.bz2 && \
    cd bcftools-${BCFTOOLS_VERSION} && ./configure --without-curses && make -s && make install && cd - && \
    rm -rf bcftools-${BCFTOOLS_VERSION}*

WORKDIR /opt/

RUN wget https://github.com/broadinstitute/gatk/releases/download/${GATK_VERSION}/gatk-${GATK_VERSION}.zip && unzip gatk-${GATK_VERSION}.zip && rm gatk-${GATK_VERSION}.zip

ENV PATH=${PATH}:/opt/gatk-${GATK_VERSION}

# Clean up 
RUN apt-get -qqy purge autoconf automake bzip2 gcc make wget && \
    apt-get -qqy clean && \
    rm -rf /tmp/* \
           /var/tmp/* \
           /var/cache/apt/* \
           /var/lib/apt/lists/* \
           /usr/share/man/?? \
           /usr/share/man/??_*

RUN ln -s /usr/bin/python3 /usr/bin/python

RUN mkdir -p /app/ && echo -e "samtools=${SAMTOOLS_VERSION}\nbcftools=${BCFTOOLS_VERSION}\ngatk=${GATK_VERSION}" > /app/software.list

WORKDIR /
