FROM continuumio/miniconda3

LABEL Maintainer="Eichler Lab"

COPY ./environment.yml /

RUN conda install -n base -c conda-forge mamba && \
    mamba env create -f /environment.yml && \
    conda clean -a

ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/conda/envs/intervene/lib/

ENV PATH=/opt/conda/envs/intervene/bin/:${PATH}

RUN echo "source activate align-basics" > ~/.bashrc

RUN mkdir -p /app/

COPY ./software.list /app/
