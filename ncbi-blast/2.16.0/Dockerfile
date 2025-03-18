FROM continuumio/miniconda3

LABEL Maintainer="Eichler Lab"

COPY ./environment.yml /

RUN conda env create -f /environment.yml && conda clean -a

ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/conda/envs/blast/lib/

ENV PATH=/opt/conda/envs/blast/bin/:${PATH}

RUN mkdir -p /app/

COPY ./software.list /app/
