FROM gettyimages/spark:2.4.1-hadoop-3.0
MAINTAINER "Israel Zúñiga de la Mora https://github.com/israelzuniga/turbo-adventure"

USER root


# install git
RUN set -ex && \
    apt-get update && apt-get install -y --no-install-recommends git


# for declarativewidgets
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y nodejs npm && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" |  tee /etc/apt/sources.list.d/yarn.list && \
    apt-get install -y yarn



# PySpark
ENV SPARK_HOME /usr/spark-2.4.1
ENV PYTHONPATH $SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.7-src.zip
ENV PYSPARK_PYTHON /usr/bin/python


# Toree
ENV DASHBOARDS_VERSION 0.4.1
ENV DASHBOARDS_BUNDLERS_VERSION 0.2.2

ENV TOREE_VERSION >=0.1.0.dev0, <=0.1.0


# get to the latest jupyter release and necessary libraries
RUN pip install jupyter seaborn futures && \
    pip install seaborn futures && \
    pip install futures

ENV DECL_WIDGETS_VERSION 0.4.3

# install incubator extensions
RUN pip install jupyter_dashboards \
    jupyter_declarativewidgets \
    jupyter_dashboards_bundlers
RUN jupyter dashboards quick-setup
# RUN jupyter declarativewidgets quick-setup
RUN jupyter nbextension enable jupyter_dashboards --py
# RUN jupyter declarativewidgets activate
# RUN jupyter nbextension enable dashboards_bundlers --py


# install Toree
RUN pip install toree
RUN jupyter toree install --user

EXPOSE 8888 4040 4041 4042 4043 4044


# include nice intro notebook
# COPY index.ipynb $HOME/notebooks/
