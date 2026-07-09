FROM continuumio/miniconda3

MAINTAINER Eichler Lab

COPY ./environment.yml /

RUN conda env create -f /environment.yml && conda clean -a

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl gnupg libxt6 \
    && mkdir -p /usr/share/keyrings && \
    curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg \
    | gpg --dearmor -o /usr/share/keyrings/google-cloud-cli.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/google-cloud-cli.gpg] http://packages.cloud.google.com/apt cloud-sdk main" \
    > /etc/apt/sources.list.d/google-cloud-sdk.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends google-cloud-cli && \
    rm -rf /var/lib/apt/lists/*

RUN gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true


ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/conda/envs/multisusie/lib/

ENV PATH=/opt/conda/envs/multisusie/bin/:${PATH}

RUN echo "source activate multisusie" > ~/.bashrc

