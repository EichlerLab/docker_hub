FROM continuumio/miniconda3

COPY ./environment.yml /

ARG longcallD_VERSION=0.0.4

RUN conda env create -f /environment.yml && conda clean -a

ENV PATH=/opt/conda/envs/longcallD/bin/:${PATH}

RUN apt-get -y update && apt-get -y install file gawk && ln -sf /usr/bin/gawk /usr/bin/awk

ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/conda/envs/longcallD/lib/

RUN echo "source activate longcallD" > ~/.bashrc

RUN mkdir -p /app/ && echo -e "longcallD=${longcallD_VERSION}" > /app/software.list
