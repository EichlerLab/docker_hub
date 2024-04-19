FROM continuumio/miniconda3


ARG COMPLEASM_VERSION="0.2.6"

COPY ./environment.yml /

RUN conda env create -f /environment.yml && conda clean -a

ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/conda/envs/compleasm/lib/

ENV PATH=/opt/conda/envs/compleasm/bin/:${PATH}

RUN wget https://github.com/huangnengCSU/compleasm/releases/download/v0.2.6/compleasm-0.2.6_x64-linux.tar.bz2 && tar -jxvf compleasm-0.2.6_x64-linux.tar.bz2

ENV PATH=/compleasm_kit/:${PATH}

RUN echo "source activate compleasm" > ~/.bashrc

RUN mkdir -p /app/ && echo -e "compleasm=${COMPLEASM_VERSION}" > /app/software.list
