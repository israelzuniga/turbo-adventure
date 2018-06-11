MAINTAINER "Israel Zúñiga de la Mora https://github.com/israelzuniga/turbo-adventure"
FROM gettyimages/2.3.0-hadoop-2.8



# Zeppelin
ENV ZEPPELIN_PORT 8080
ENV ZEPPELIN_HOME /usr/zeppelin
ENV ZEPPELIN_CONF_DIR $ZEPPELIN_HOME/conf
ENV ZEPPELIN_NOTEBOOK_DIR $ZEPPELIN_HOME/notebook
ENV ZEPPELIN_COMMIT v0.7.3
RUN echo '{ "allow_root": true }' > /root/.bowerrc
