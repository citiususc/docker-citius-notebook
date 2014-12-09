FROM ipython/scipystack

# Installing R
RUN apt-get install -y \
        r-base \
        r-base-dev

# Installing rpy2
RUN pip install rpy2
RUN pip install singledispatch
RUN pip3 install rpy2

# Installing julia
#RUN apt-get update && apt-get install -y \
#	software-properties-common \
#	python-software-properties

#RUN add-apt-repository ppa:staticfloat/juliareleases
#RUN apt-get update && apt-get install -y julia
#RUN julia -e 'Pkg.add("PyCall")'

# Installing pyjulia
#WORKDIR /
#RUN git clone https://github.com/JuliaLang/pyjulia.git
#WORKDIR /pyjulia
#RUN python setup.py install
#RUN python3 setup.py install
#WORKDIR /
#RUN rm -R pyjulia

# Adding julia snippet capability
#WORKDIR /
#RUN sed -i "/pypy/a 'julia'," /usr/local/lib/python2.7/dist-packages/IPython/core/magics/script.py
#RUN sed -i "/pypy/a 'julia'," /usr/local/lib/python3.4/dist-packages/IPython/core/magics/script.py

# Creating service
VOLUME /notebooks
WORKDIR /notebooks

EXPOSE 8888

# You can mount your own SSL certs as necessary here
ENV PEM_FILE /key.pem

ADD notebook.sh /
RUN chmod u+x /notebook.sh

ADD config.py /

