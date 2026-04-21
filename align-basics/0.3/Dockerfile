FROM continuumio/miniconda3

MAINTAINER Eichler Lab

COPY ./environment.yml /

RUN conda env create -f /environment.yml && conda clean -a

ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/conda/envs/align-basics/lib/

ENV PATH=/opt/conda/envs/align-basics/bin/:${PATH}

RUN echo "source activate align-basics" > ~/.bashrc

RUN apt-get update && apt-get install -y --no-install-recommends \
    g++ \
    make \
    zlib1g-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# clone and build samtools_fqidx
RUN git clone https://github.com/youngjun0827/samtools-fqidx-comment.git /opt/samtools-fqidx-comment && \
    make -C /opt/samtools-fqidx-comment && \
    make -C /opt/samtools-fqidx-comment install PREFIX=/usr/local

RUN mkdir -p /app/

COPY ./software.list /app/

