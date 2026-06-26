FROM continuumio/miniconda3
MAINTAINER Eichler Lab
ARG CYVCF2_VERSION=0.33.0
RUN conda install -y python=3.11 && conda clean -afy
RUN python -m pip install --no-cache-dir cyvcf2==${CYVCF2_VERSION}
RUN python -c "from cyvcf2 import VCF" && \
    cyvcf2 --help
RUN mkdir -p /app/ && echo -e "cyvcf2=${CYVCF2_VERSION}" > /app/software.list
