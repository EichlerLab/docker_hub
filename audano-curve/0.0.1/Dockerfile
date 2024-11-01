FROM continuumio/miniconda3

COPY ./environment.yml /

RUN conda env create -f /environment.yml && conda clean -a

ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/conda/envs/audano-curve/lib/

ENV PATH=/opt/conda/envs/audano-curve/bin/:${PATH}

RUN echo "source activate audano-curve" > ~/.bashrc

RUN mkdir -p /app/

COPY ./Dockerfile /

COPY ./environment.yml /
