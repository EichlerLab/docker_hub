FROM continuumio/miniconda3

MAINTAINER Eichler Lab

COPY ./environment.yml /

RUN conda env create -f /environment.yml && conda clean -a

ENV PATH=/opt/conda/envs/pullregions/bin/:${PATH}

RUN apt-get -y update && apt-get -y install file gawk && ln -sf /usr/bin/gawk /usr/bin/awk

ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/conda/envs/pullregions/lib/

RUN echo "source activate pullregions" > ~/.bashrc

RUN mkdir -p /app/

ENV CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

COPY ./software.list /app/
