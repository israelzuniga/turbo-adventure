FROM gettyimages/spark:2.2.0-hadoop-2.7
MAINTAINER "Israel Zúñiga de la Mora https://github.com/israelzuniga/turbo-adventure"


USER root

# for declarativewidgets
RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash - && \
    apt-get install -y nodejs npm && \
npm install -g bower
