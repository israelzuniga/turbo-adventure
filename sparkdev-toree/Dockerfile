FROM gettyimages/spark:2.4.1-hadoop-3.0
MAINTAINER "Israel Zúñiga de la Mora https://github.com/israelzuniga/turbo-adventure"

ENV APACHE_SPARK_VERSION 2.4.1


USER root


# install git
RUN set -ex && \
    apt-get update && apt-get install -y --no-install-recommends git


# for declarativewidgets
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y nodejs npm && \
npm install -g bower



# PySpark
ENV SPARK_HOME /usr/local/spark
ENV PYTHONPATH $SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.1-src.zip
ENV PYSPARK_PYTHON /home/main/anaconda2/envs/python3/bin/python

# Toree
ENV DASHBOARDS_VERSION ==0.4.1
ENV DASHBOARDS_BUNDLERS_VERSION ==0.2.2

ENV TOREE_VERSION >=0.1.0.dev0, <=0.1.0


# get to the latest jupyter release and necessary libraries
RUN pip install jupyter seaborn futures && \
    pip install seaborn futures && \
    pip install futures && \
    bash -c "source activate python3 && \
        conda install seaborn"

ENV DECL_WIDGETS_VERSION 0.4.3

# install incubator extensions
RUN pip install jupyter_dashboards==0.4.1 \
    jupyter_declarativewidgets==$DECL_WIDGETS_VERSION \
    jupyter_dashboards_bundlers==0.2.2
RUN jupyter dashboards install --user --symlink && \
    jupyter declarativewidgets install --user --symlink && \
    jupyter dashboards activate && \
    jupyter declarativewidgets activate && \
    jupyter dashboards_bundlers activate

# install kernel-side incubator extensions for python3 environment too
RUN bash -c "source activate python3 && pip install jupyter_declarativewidgets==$DECL_WIDGETS_VERSION"

# install Toree
RUN pip install 'toree>=0.1.0.dev0, <=0.1.0'
RUN jupyter toree install --user

EXPOSE 8080 4040 4041 4042 4043 4044


# include nice intro notebook
COPY index.ipynb $HOME/notebooks/
