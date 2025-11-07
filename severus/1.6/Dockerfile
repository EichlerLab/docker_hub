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


#RUN wget https://github.com/KolmogorovLab/Severus/archive/refs/tags/1.6.tar.gz && tar -zxvf 1.6.tar.gz 


#COPY ./environment.yml /environment.yml

RUN git clone https://github.com/KolmogorovLab/Severus
RUN cd Severus && conda env create --name severus_env --file /opt/Severus/environment.yml && conda clean -a

RUN echo "conda activate severus_env" >> ~/.bashrc
RUN echo "/opt/Severus/severus.py" >> ~/.bashrc
RUN source ~/.bashrc

ENV PATH="/opt/conda/envs/severus_env/bin:${PATH}"
ENV PATH="/opt/Severus/:${PATH}"
ENV PATH="/opt/conda/envs/severus_env/lib/:${PATH}"
ENV PATH="/opt/Severus/severus:${PATH}"
