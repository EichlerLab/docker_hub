FROM centos:7.9.2009
LABEL maintainer="Julie Wertz <jwertz1@uw.edu>"

# Fix mirror URLs for deprecated CentOS, vault.centos.org instead of mirror.centos.org
RUN sed -i 's|^mirrorlist=|#mirrorlist=|g' /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i 's|^#baseurl=http://mirror.centos.org|baseurl=https://vault.centos.org|g' /etc/yum.repos.d/CentOS-Base.repo

# System libraries
RUN yum update -y && \
yum install -y wget bzip2 gcc gcc-c++ && \
yum clean all && rm -rf /var/cache/yum

# Get miniconda 4.8.3
RUN mkdir -p /opt/conda/envs/miniconda_4_8_3 && \
wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.8.3-Linux-x86_64.sh -O /opt/conda/envs/miniconda_4_8_3/miniconda.sh && \
bash /opt/conda/envs/miniconda_4_8_3/miniconda.sh -b -u -p /opt/conda/envs/miniconda_4_8_3

# Copy into image
COPY environment.yml /
COPY stringdecomposer /opt/stringdecomposer

ENV PATH=/opt/conda/envs/miniconda_4_8_3/bin/:/opt/stringdecomposer/bin/:${PATH}
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/conda/envs/miniconda_4_8_3/lib/

RUN conda env create -f /environment.yml && conda clean -a

RUN echo "source activate miniconda_4_8_3" > ~/.bashrc