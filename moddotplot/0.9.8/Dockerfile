FROM continuumio/miniconda3

MAINTAINER Eichler Lab

ARG MODDOTPLOT_VERSION=0.9.8

RUN git clone https://github.com/marbl/ModDotPlot.git

WORKDIR ModDotPlot

RUN ls && which python
RUN git checkout v${MODDOTPLOT_VERSION}
RUN python -m pip install .

RUN mkdir -p /app/ && echo -e "moddotplot=${MODDOTPLOT_VERSION}" > /app/software.list
