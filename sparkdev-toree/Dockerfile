FROM gettyimages/spark:2.2.0-hadoop-2.7
MAINTAINER "Israel Zúñiga de la Mora https://github.com/israelzuniga/turbo-adventure"

ENV APACHE_SPARK_VERSION 2.2.0

USER root

# for declarativewidgets
RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash - && \
    apt-get install -y nodejs npm && \
npm install -g bower



# PySpark
ENV SPARK_HOME /usr/local/spark
ENV PYTHONPATH $SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.1-src.zip
ENV PYSPARK_PYTHON /home/main/anaconda2/envs/python3/bin/python


USER main

ENV DASHBOARDS_VERSION ==0.4.1
ENV DASHBOARDS_BUNDLERS_VERSION ==0.2.2

ENV TOREE_VERSION >=0.1.0.dev0, <=0.1.0


# get to the latest jupyter release and necessary libraries
RUN conda install -y jupyter seaborn futures && \
    bash -c "source activate python3 && \
        conda install seaborn"
