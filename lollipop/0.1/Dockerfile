FROM continuumio/miniconda3
#FROM ubuntu:22.04

#ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /home
COPY ./install_packages.R /

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


#RUN apt-get -qqy update --fix-missing && \
#    apt-get -qqy dist-upgrade && \
#    apt-get -qqy install r-base r-base-dev default-jre

#RUN Rscript ./install_packages.R

COPY ./environment.yml /
RUN conda env create -f /environment.yml && conda clean -a
ENV PATH=/opt/conda/envs/r_env/bin/:${PATH}
RUN apt-get -y update && apt-get -y install file gawk && ln -sf /usr/bin/gawk /usr/bin/awk
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/conda/envs/assembly_eval/lib/
RUN echo "conda activate r_env" > ~/.bashrc


RUN Rscript -e "install.packages(c('argparse'),repos = 'http://cran.us.r-project.org')"

#RUN Rscript -e "install.packages('cowplot',repos = 'http://cran.us.r-project.org')"
ENV PATH /home/:$PATH
