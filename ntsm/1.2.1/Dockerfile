FROM continuumio/miniconda4

LABEL maintainer="YOUNGJUN KWON"

ARG NTSM_VERSION=1.2.1

RUN conda create --name ntsm && conda install ntsm==${NTSM_VERSION} -n pbsv -c bioconda && conda clean -a

ENV PATH=/opt/conda/envs/ntsm/bin/:${PATH}

RUN echo "source activate ntsm" > ~/.bashrc

RUN mkdir -p /app/ && echo -e "ntsm=${NTSM_VERSION}" > /app/software.list