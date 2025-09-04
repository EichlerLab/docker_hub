FROM continuumio/miniconda3

MAINTAINER Eichler Lab

ARG MODDOTPLOT_VERSION=0.9.8

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends build-essential pkg-config zlib1g-dev && rm -rf /var/lib/apt/lists/*

RUN conda install -y python=3.11 && conda clean -afy

RUN git clone https://github.com/marbl/ModDotPlot.git && cd ModDotPlot && git checkout v${MODDOTPLOT_VERSION} && python -m pip install .

RUN mkdir -p /app/ && echo -e "moddotplot=${MODDOTPLOT_VERSION}" > /app/software.list
