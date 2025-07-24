FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /home

COPY ./install_packages.R /
ENV R_LIBS_SITE=/usr/local/lib/R/site-library
ENV PATH=/usr/local/lib/R/site-library:${PATH}

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


RUN apt-get install build-essential
RUN apt-get install libcurl4-gnutls-dev
RUN apt-get install libxml2-dev
RUN apt-get install libssl-dev


RUN apt-get -qqy update --fix-missing && \
    apt-get -qqy dist-upgrade && \
    apt-get -qqy install r-base r-base-dev

RUN Rscript -e "install.packages(c('argparse'))"
WORKDIR /home

RUN Rscript -e "install.packages('devtools', dependencies = TRUE)"
RUN Rscript -e "library(devtools)"
RUN Rscript -e "devtools::install_github('daewoooo/SVbyEye', branch='master')"
#RUN Rscript ./install_packages.R

ENV PATH /home/:$PATH

