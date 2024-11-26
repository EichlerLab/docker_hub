FROM python:3.8-slim

WORKDIR /app
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
                 git \
                 zlib1g-dev \
                 libx11-6 \
                 libxext6 \
                 libxrender1 \
                 libxtst6 \
                 libxi6 \
                 tk \
                 libtk8.6 \
                 python3-tk \
                 && apt-get clean

RUN pip install --no-cache-dir modbamtools
CMD ["bash"]
