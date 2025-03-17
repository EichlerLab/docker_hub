FROM continuumio/miniconda3

ARG SQANTI3_VERSION="5.3.6"

WORKDIR /opt/sqanti

RUN wget https://github.com/ConesaLab/SQANTI3/archive/refs/tags/v${SQANTI3_VERSION}.tar.gz && \
    tar -xf v${SQANTI3_VERSION}.tar.gz && \
    rm -rf v${SQANTI3_VERSION}.tar.gz

WORKDIR /opt/sqanti/SQANTI3-${SQANTI3_VERSION}

COPY ./environment.yml /

RUN conda env create -f /environment.yml && conda clean -a

ENV PATH=/opt/sqanti/SQANTI3-${SQANTI3_VERSION}/:${PATH}

RUN mkdir -p /app/ && echo -e "sqanti3=${SQANTI3_VERSION}" > /app/software.list
