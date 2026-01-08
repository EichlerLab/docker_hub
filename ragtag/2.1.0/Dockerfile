FROM mambaorg/micromamba:1.5.10

LABEL maintainer="Eichler Lab"

WORKDIR /work

RUN micromamba create -y -c conda-forge -c bioconda -p /opt/ragtag ragtag \
 && micromamba clean -a -y

ENV PATH=/opt/ragtag/bin:${PATH}

WORKDIR /app
COPY ./software.list /app/


