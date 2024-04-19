FROM continuumio/miniconda3

MAINTAINER William T Harvey

COPY ./environment.yml /

RUN conda env create -f /environment.yml && conda clean -a

ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/conda/envs/sniffles/lib/

ENV PATH=/opt/conda/envs/sniffles/bin/:${PATH}

RUN echo "source activate sniffles" > ~/.bashrc

RUN echo -e "sniffles=2.3.2" > /app/software.list

