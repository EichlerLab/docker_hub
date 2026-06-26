FROM continuumio/miniconda3
MAINTAINER Eichler Lab
ARG CYVCF2_VERSION=0.33.0
ARG PANDAS_VERSION=2.3.3
RUN conda install -y python=3.11 && conda clean -afy
RUN python -m pip install --no-cache-dir cyvcf2==${CYVCF2_VERSION} pandas==${PANDAS_VERSION}
RUN python -c "from cyvcf2 import VCF; import pandas" &&  cyvcf2 --help
RUN mkdir -p /app/ && echo -e "cyvcf2=${CYVCF2_VERSION}\npandas=${PANDAS_VERSION}" > /app/software.list
