FROM continuumio/miniconda3

COPY ./environment.yml /

ARG longcalld_VERSION=0.0.4

RUN conda env create -f /environment.yml && conda clean -a

ENV PATH=/opt/conda/envs/longcalld/bin/:${PATH}

RUN apt-get -y update && apt-get -y install file gawk && ln -sf /usr/bin/gawk /usr/bin/awk

ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/conda/envs/longcalld/lib/

RUN echo "source activate longcalld" > ~/.bashrc

RUN mkdir -p /app/ && echo -e "longcalld=${longcallDdVERSION}" > /app/software.list
