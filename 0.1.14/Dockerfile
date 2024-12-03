FROM ubuntu:22.04

RUN git clone https://github.com/vcftools/vcftools.git /opt/vcftools
WORKDIR /opt/vcftools
RUN cd /opt/vcftools
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install
ENV PATH=/opt/vcftools:$PATH

