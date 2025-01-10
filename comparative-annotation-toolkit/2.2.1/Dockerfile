FROM continuumio/miniconda3
MAINTAINER Eichler Lab


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
                rsync \
                xz-utils \
                zlib1g-dev


COPY ./environment.yaml 
RUN conda env create -f /environment.yaml && conda clean -a

#RUN echo "source activate ComparativeAnnotationToolkit" > ~/.bashrc


RUN git clone https://github.com/ComparativeGenomicsToolkit/Comparative-Annotation-Toolkit.git
#RUN wget https://github.com/ComparativeGenomicsToolkit/Comparative-Annotation-Toolkit.git

RUN pip install -e Comparative-Annotation-Toolkit

RUN echo "source activate ComparativeAnnotationToolkit" > ~/.bashrc

