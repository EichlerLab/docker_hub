FROM continuumio/miniconda3

COPY ./environment.yml /

RUN conda env create -f /environment.yml && conda clean -a

ENV PATH=/opt/conda/envs/locityper/bin/:${PATH}

RUN apt-get -y update && apt-get -y install file gawk && ln -sf /usr/bin/gawk /usr/bin/awk

ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/conda/envs/locityper/lib/

RUN echo "source activate locityper" > ~/.bashrc

RUN mkdir -p /app/
