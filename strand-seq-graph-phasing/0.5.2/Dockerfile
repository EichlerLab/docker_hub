FROM continuumio/miniconda3:4.10.3

MAINTAINER Eichler Lab

COPY ./environment.yml /

RUN conda env create -f /environment.yml && conda clean -a

ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/conda/envs/strand-seq-graph-phasing/lib/


ENV PATH=/opt/conda/envs/env_Renv2/bin/:${PATH}

RUN echo "source activate env_Renv2" > ~/.bashrc

RUN mkdir -p /app/

#COPY ./software.list /app/

#RUN PATH="/opt/conda/bin:/usr/local/bin:/usr/bin:/bin:"

#RUN PATH=/opt/conda/bin:$PATH
