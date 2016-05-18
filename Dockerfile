FROM jupyter/scipy-notebook

USER root
RUN apt-get update && apt-get install -y graphviz
RUN conda install -y numpy scipy pandas h5py matplotlib toolz pytables
RUN conda install -y dask
RUN pip install --upgrade pip
RUN pip install castra graphviz
USER jovyan

RUN git clone https://github.com/dask/dask-tutorial.git ./dask-tutorial
RUN cd dask-tutorial && python prep.py && cd ..

RUN git clone https://github.com/dask/dask-examples.git ./dask-examples
