FROM continuumio/miniconda3

ARG SQANTI3_VERSION="5.2.1"

RUN wget https://github.com/ConesaLab/SQANTI3/archive/refs/tags/v5.2.1.tar.gz

RUN tar -xf v5.2.1.tar.gz

WORKDIR /SQANTI3-5.2.1

COPY ./SQANTI3.conda_env.yml /

RUN conda env create -f /SQANTI3.conda_env.yml && conda clean -a

ENV PATH=/SQANTI3-5.2.1/:${PATH}

RUN mkdir -p /app/ && echo -e "SQANTI3=${SQANTI3_VERSION}" > /app/software.list

WORKDIR /

COPY ./Dockerfile /