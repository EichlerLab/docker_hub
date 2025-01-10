FROM continuumio/miniconda3
MAINTAINER Eichler Lab

COPY ./environment.yml /

RUN conda env create -f /environment.yml && conda clean -a

#RUN echo "source activate ComparativeAnnotationToolkit" > ~/.bashrc


RUN git clone https://github.com/ComparativeGenomicsToolkit/Comparative-Annotation-Toolkit.git
#RUN wget https://github.com/ComparativeGenomicsToolkit/Comparative-Annotation-Toolkit.git

RUN pip install -e Comparative-Annotation-Toolkit

RUN echo "source activate ComparativeAnnotationToolkit" > ~/.bashrc

