FROM continuumio/miniconda3

MAINTAINER Eichler Lab

ARG MODDOTPLOT_VERSION=0.8.2

RUN git clone https://github.com/marbl/ModDotPlot.git && cd ModDotPlot && git checkout v${MODDOTPLOT_VERSION} && python -m pip install .

RUN mkdir -p /app/ && echo -e "moddotplot=${MODDOTPLOT_VERSION}" > /app/software.list
