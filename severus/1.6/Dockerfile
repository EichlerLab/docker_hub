#FROM ubuntu:22.04
FROM continuumio/miniconda3

WORKDIR /opt

#FROM continuumio/miniconda3

#FROM ubuntu:22.04
# Default build libraries
RUN apt-get -qqy update --fix-missing && \
    apt-get -qqy dist-upgrade && \
    apt-get -qqy install --no-install-recommends \
                 ca-certificates \
                 libbz2-dev \
                 libcurl4-openssl-dev \
                 liblzma-dev \
                 libncurses5-dev \
                 autoconf \
                 automake \
                 bzip2 \
                 gcc \
                 g++ \
                 git \
                 make \
                 wget \
                 xz-utils \
                 zlib1g-dev


#COPY ./environment.yml /environment.yml

RUN git clone https://github.com/KolmogorovLab/Severus
RUN cd Severus && conda env create --name severus_env --file /opt/Severus/environment.yml && conda clean -a

RUN echo "conda activate severus_env" >> ~/.bashrc
RUN /opt/Severus/severus.py


ENV PATH="/opt/conda/envs/severus_env/bin:${PATH}"
ENV PATH="/opt/Severus/:${PATH}"
ENV PATH="/opt/conda/envs/severus_env/lib/:${PATH}"
ENV PATH="/opt/Severus/severus:${PATH}"


