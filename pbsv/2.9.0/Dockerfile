FROM continuumio/miniconda3

MAINTAINER William T Harvey

ARG PBSV_VERSION=2.9.0


RUN conda create --name pbsv && conda install pbsv==${PBSV_VERSION} -n pbsv -c bioconda && conda clean -a

ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/conda/envs/pbsv/lib/

ENV PATH=/opt/conda/envs/pbsv/bin/:${PATH}

RUN echo "source activate pbsv" > ~/.bashrc

RUN mkdir -p /app/ && echo -e "pbsv=${PBSV_VERSION}" > /app/software.list
