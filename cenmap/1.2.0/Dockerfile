FROM continuumio/miniconda3

LABEL maintainer="Eichler Lab"

COPY ./environment.yml /

RUN conda env create -f /environment.yml && conda clean -a

ENV LD_LIBRARY_PATH=/opt/conda/envs/cenmap/lib/

ENV PATH=/opt/conda/envs/cenmap/bin/:${PATH}

RUN echo "source activate cenmap" > ~/.bashrc

RUN mkdir -p /app/

COPY ./software.list /app/

