FROM continuumio/miniconda3

MAINTAINER Eichler Lab

RUN apt-get  update --fix-missing && \
    apt-get -y install --no-install-recommends \
    ca-certificates \
    default-jre \
    autoconf \
    automake \
    wget \
    unzip 

RUN apt-get install --fix-missing -y xvfb  

RUN mkdir -p /igv && \
    cd /igv && \
    wget http://data.broadinstitute.org/igv/projects/downloads/2.19/IGV_2.19.1.zip

RUN cd /igv && \
    unzip IGV_2.19.1.zip && \
    cd IGV_2.19.1

RUN cd /usr/bin && \
    ln -s /igv/IGV_2.19.1/igv.sh ./igv

RUN apt-get update && apt-get install -y libnss-sss && apt-get clean all

#FROM openjdk:17-jdk-slim
