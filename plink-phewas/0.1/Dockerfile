FROM continuumio/miniconda3

MAINTAINER Eichler Lab

COPY ./environment.yml /

RUN conda env create -f /environment.yml && conda clean -a

ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/conda/envs/plink-phewas/lib/

ENV PATH=/opt/conda/envs/plink-phewas/bin/:${PATH}

RUN echo "source activate plink-phewas" > ~/.bashrc

RUN mkdir -p /app/

COPY ./software.list /app/
