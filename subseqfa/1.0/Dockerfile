FROM centos:7

MAINTAINER William T Harvey


# Default build libraries
RUN yum -y update && \
   yum -y install centos-release-scl && \
   yum -y install devtoolset-10 \
                ca-certificates \
                bzip2-devel \
                libcurl-devel \
                xz-devel \
                libncurses5-dev \
                autoconf \
                automake \
                cmake \
                bzip2 \
                devtoolse \
                make \
                wget \
                git \
                boost-devel \
                zlib-devel # buildkit


RUN wget https://github.com/samtools/htslib/releases/download/1.19.1/htslib-1.19.1.tar.bz2 && tar xvf htslib-1.19.1.tar.bz2 && cd htslib-1.19.1 && ./configure && make && make install


RUN scl enable devtoolset-10 "git clone https://github.com/EichlerLab/subseq.git && cd subseq && git checkout docker && make clean && make bin/subseqfa && cp bin/subseqfa /usr/bin/"

ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/lib"

RUN mkdir -p /app/ && echo -e "subseqfa=1.0" > /app/software.list