FROM continuumio/miniconda3

MAINTAINER Eichler Lab

COPY ./environment.yml /

RUN conda env create -f /environment.yml && conda clean -a

ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/conda/envs/pod5/lib/

ENV PATH=/opt/conda/envs/pod5/bin/:${PATH}

RUN echo "source activate pod5" > ~/.bashrc

