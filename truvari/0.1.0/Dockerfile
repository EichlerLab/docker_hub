FROM  us.gcr.io/broad-dsp-gcr-public/terra-jupyter-base:latest

USER root

ENV PIP_USER=false

RUN apt-get update && apt-get install -yq --no-install-recommends \
  python-tk \
  tk-dev \
  libssl-dev \
  xz-utils \
  libhdf5-dev \
  openssl \
  make \
  cmake \
  liblzo2-dev \
  zlib1g-dev \
  libz-dev \
  wget \
  bc \
  unzip \
  bzip2 \
  bcftools \
  samtools \
  bedtools \
  libclang-dev \
  libncurses-dev \
  zlib1g-dev \
  libbz2-dev \
  libssl-dev \
  liblzma-dev \
  libcurl4-openssl-dev \
  libcurl4-openssl-dev \
  build-essential \
  software-properties-common \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENV HTSLIB_CONFIGURE_OPTIONS="--enable-gcs"

COPY requirements.txt /etc/terra-docker/

RUN pip3 -V \
  && pip3 install --upgrade pip \
  && pip3 install --upgrade -r /etc/terra-docker/requirements.txt

RUN pip3 install --upgrade markupsafe==2.1.2

# Turn off beatrix-jupyterlab and bq_stats plugins, they don't activate cleanly in our version
# of jupyter and they're google-managed packages we don't have access to older versions of.
# Retain two plugins: google.cloud.bigquery and sql
RUN sed -i "s/^\( *'beatrix_jupyterlab',\)/#\1/g" /etc/ipython/ipython_kernel_config.py
RUN sed -i "s/^\( *'bq_stats',\)/#\1/g" /etc/ipython/ipython_kernel_config.py



ENV USER=jupyter
USER $USER
# We want pip to install into the user's dir when the notebook is running.
ENV PIP_USER=true
# Enable Intel oneDNN optimizatoin by default
ENV TF_ENABLE_ONEDNN_OPTS=1

# # Note: this entrypoint is provided for running Jupyter independently of Leonardo.
# # When Leonardo deploys this image onto a cluster, the entrypoint is overwritten to enable
# # additional setup inside the container before execution.  Jupyter execution occurs when the
# # init-actions.sh script uses 'docker exec' to call run-jupyter.sh.
ENTRYPOINT ["/opt/conda/bin/jupyter", "notebook"]