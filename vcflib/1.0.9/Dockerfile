FROM ubuntu:22.04

RUN apt-get update --fix-missing && apt-get -qqy dist-upgrade && apt-get install -y -f --no-install-recommends build-essential fakeroot \
        bzip2 \
        ca-certificates \
        cmake \
        tzdata \
        gcc \
        g++ \
        git \
        libbz2-dev \
        libcurl4-gnutls-dev \
        libhts-dev \
        libjsoncpp-dev \
        libtabixpp-dev \
        libtabixpp0 \
        liblzma-dev \
        pandoc \
        pkg-config \
        python3 \
        python3-dev \
        python3-pip \
        tabix \
        zlib1g

RUN git clone --recursive https://github.com/vcflib/vcflib.git

RUN cd vcflib && git checkout -b 0a05bec && mkdir -p build && cd build && cmake -DCMAKE_BUILD_TYPE=Debug -DZIG=OFF -DOPENMP=OFF .. && cmake --build . && cmake --install .  


RUN cp /vcflib/build/contrib/WFA2-lib/libwfa2.so.0 /lib/x86_64-linux-gnu/

RUN ldconfig

ENV PATH="/usr/local/bin:${PATH}"
