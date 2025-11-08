FROM continuumio/miniconda3

COPY ./environment.yml /

# this is a comment

RUN conda env create -f /environment.yml && conda clean -a

ENV PATH=/opt/conda/envs/severus/bin/:${PATH}

RUN apt-get -y update && apt-get -y install file gawk && ln -sf /usr/bin/gawk /usr/bin/awk

RUN echo "source activate severus" > ~/.bashrc

RUN mkdir -p /app/
