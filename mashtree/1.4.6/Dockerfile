FROM ubuntu:22.04

MAINTAINER William T Harvey

# Default build libraries
RUN apt-get -qqy update --fix-missing && \
    apt-get -qqy dist-upgrade && \
    apt-get -qqy install --no-install-recommends  \
                 ca-certificates \
                 libbz2-dev \
                 libcurl4-openssl-dev \
                 liblzma-dev \
                 libncurses5-dev \
                 autoconf \
                 automake \
                 bzip2  \
                 cmake \
                 gcc \
                 g++ \
                 make \
                 wget \
                 cargo \
                 libssl-dev \
                 zlib1g-dev # buildki

ENV PERL5LIB=$PERL5LIB:$HOME/lib/perl5

RUN apt-get -y update && apt-get -y install build-essential cpanminus libexpat1-dev wget 

RUN cpanm --notest Net::SSLeay

RUN cpanm --notest IO::Socket::SSL

RUN cpanm --notest Alien::Libxml2

RUN cpanm --notest XML::LibXML XML::LibXML::Reader 

RUN cpanm --notest BioPerl Bio::Sketch::Mash

RUN mkdir -pv $HOME/bin/build && \
    cd $HOME/bin/build && \ 
    wget https://github.com/khowe/quicktree/archive/v2.5.tar.gz && \
    tar xvf v2.5.tar.gz && \
    cd quicktree-2.5 && \
    make && \
    mv quicktree /usr/bin/

RUN mkdir -pv $HOME/bin/build && \
    cd $HOME/bin/build && \
    wget https://github.com/marbl/Mash/releases/download/v2.2/mash-Linux64-v2.2.tar && \
    tar xvf mash-Linux64-v2.2.tar && \
    mv -v mash-Linux64-v2.2/mash /usr/bin/

RUN cpanm Mashtree && mashtree --help # verify it shows usage and not an error


