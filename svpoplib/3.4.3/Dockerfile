FROM continuumio/miniconda3

MAINTAINER Eichler Lab

COPY ./environment.yml /

RUN conda env create -f /environment.yml && conda clean -a

ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/conda/envs/svpoplib/lib/

ENV PATH=/opt/conda/envs/svpoplib/bin/:${PATH}

RUN apt-get -y update && apt-get -y install git

WORKDIR /opt/

RUN git clone https://github.com/EichlerLab/svpop.git

WORKDIR /

ENV PYTHONPATH=${PYTHONPATH}:/opt/svpop/

RUN echo "source activate svpoplib" > ~/.bashrc

RUN mkdir -p /app/
