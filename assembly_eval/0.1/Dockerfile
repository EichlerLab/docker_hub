FROM continuumio/miniconda3

MAINTAINER William T Harvey

COPY ./environment.yml /

RUN conda env create -f /environment.yml && conda clean -a

ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/conda/envs/assembly_eval/lib/

ENV PATH=/opt/conda/envs/assembly_eval/bin/:${PATH}

RUN apt-get -y update && apt-get -y install file

RUN echo "source activate assembly_eval" > ~/.bashrc

COPY mkdir -p /app/ && cp ./software.list /app/
