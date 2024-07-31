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
RUN mkdir -p /opt/conda && \
wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.8.3-Linux-x86_64.sh -O /opt/conda/miniconda.sh && \
bash /opt/conda/miniconda.sh -b -u -p /opt/conda

# Copy into image
COPY environment.yml /
COPY stringdecomposer /opt/stringdecomposer

# Creates /opt/conda/envs/miniconda_4_8_3
RUN /opt/conda/bin/conda env create -f /environment.yml && /opt/conda/bin/conda clean -a

ENV PATH=/opt/conda/envs/miniconda_4_8_3/bin/:/opt/stringdecomposer/bin/:${PATH}
ENV LD_LIBRARY_PATH=/opt/conda/envs/miniconda_4_8_3/lib/:${LD_LIBRARY_PATH}

RUN echo "source activate miniconda_4_8_3" > ~/.bashrc