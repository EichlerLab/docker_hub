# rhodonite
FROM condaforge/mambaforge:24.11.0-0

ARG ENV_NAME=rhodonite
ENV DEBIAN_FRONTEND=noninteractive

LABEL Maintanier="Eichler Lab"


RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/rhodonite
COPY environment.yaml /opt/rhodonite/env.yaml

RUN mamba env create -n ${ENV_NAME} -f /opt/rhodonite/env.yaml && \
    mamba clean -a -y

ENV PATH=/opt/conda/envs/${ENV_NAME}/bin:$PATH
ENV CONDA_DEFAULT_ENV=${ENV_NAME}
ENV PERL5LIB=/opt/conda/envs/${ENV_NAME}/lib/perl5:$PERL5LIB

RUN RepeatMasker -h >/dev/null 2>&1 || true && \
    trf 2>/dev/null || true && \
    samtools --version && \
    bedtools --version


WORKDIR /app
COPY ./software.list /app/

CMD ["bash"]
