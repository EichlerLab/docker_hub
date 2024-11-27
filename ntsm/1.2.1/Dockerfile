FROM continuumio/miniconda3

LABEL maintainer="YOUNGJUN KWON"

ARG NTSM_VERSION=1.2.1

RUN conda create --name ntsm -y && \
    conda install ntsm==${NTSM_VERSION} -n ntsm -c bioconda -y && \
    conda clean -a

ENV PATH=/opt/conda/envs/ntsm/bin/:${PATH}

RUN echo "source activate ntsm" > ~/.bashrc

RUN mkdir -p /app/ && echo -e "ntsm=${NTSM_VERSION}" > /app/software.list
