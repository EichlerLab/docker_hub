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


#RUN apt-get -qqy install --no-install-recommends  build-essential
#RUN apt-get -qqy install --no-install-recommends  libcurl4-gnutls-dev
#RUN apt-get -qqy install --no-install-recommends  libxml2-dev
#RUN apt-get -qqy install --no-install-recommends  libssl-dev


RUN apt-get -qqy update --fix-missing && \
    apt-get -qqy dist-upgrade && \
    apt-get -qqy install r-base=4.3.0 r-base-dev

RUN Rscript -e "install.packages(c('argparse'))"

#RUN Rscript -e "install.packages('devtools', dependencies = TRUE)"
#RUN Rscript -e "library(devtools)"
#RUN Rscript -e "devtools::install_github('daewoooo/SVbyEye', branch='master')"

#RUN Rscript ./install_packages.R


#RUN Rscript -e "install.packages('remotes', lib='/usr/local/lib/R/site-library')
#RUN Rscript -e "library(remotes)"
#RUN Rscript -e "remotes::install_github('daewoooo/SVbyEye', lib='/usr/local/lib/R/site-library')"


RUN Rscript -e "install.packages('remotes')"
RUN Rscript -e "library(remotes)"
RUN Rscript -e "remotes::install_github('daewoooo/SVbyEye')"


ENV PATH /home/:$PATH

