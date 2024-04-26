FROM continuumio/miniconda3

MAINTAINER William T Harvey

COPY ./environment.yml /

RUN conda env create -f /environment.yml && conda clean -a

ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/conda/envs/cen_align/lib/

ENV PATH=/opt/conda/envs/cen_align/bin/:${PATH}

RUN echo "source activate cen_align" > ~/.bashrc
