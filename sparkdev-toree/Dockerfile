FROM gettyimages/spark:2.4.1-hadoop-3.0
MAINTAINER "Israel Zúñiga de la Mora https://github.com/israelzuniga/turbo-adventure"



# install git
RUN set -ex && \
    apt-get update && apt-get install -y --no-install-recommends git \
    g++ libc6-dev wget;



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



# Jupyter
#
RUN wget https://raw.githubusercontent.com/guangie88/jupyter-pyspark-toree-docker/master/run.sh


RUN python3 -m pip install --no-cache-dir "jupyter" "tornado<6" toree; \
    jupyter; \
    # Set the right Python version for Spark worker under PySpark
    apt-get install -y --no-install-recommends jq; \
    PYTHON3_KERNEL_CONF="/usr/local/share/jupyter/kernels/python3/kernel.json"; \
    cat "${PYTHON3_KERNEL_CONF}" \
        | jq --argjson env '{ "PYSPARK_PYTHON": "python3" }' '. + {env: $env}' \
        > "${PYTHON3_KERNEL_CONF}.tmp"; \
    mv "${PYTHON3_KERNEL_CONF}.tmp" "${PYTHON3_KERNEL_CONF}"; \
    PYTHON2_KERNEL_CONF="/usr/local/share/jupyter/kernels/python2/kernel.json"; \
    cat "${PYTHON2_KERNEL_CONF}" \
        | jq --argjson env '{ "PYSPARK_PYTHON": "python2" }' '. + {env: $env}' \
        > "${PYTHON2_KERNEL_CONF}.tmp"; \
    mv "${PYTHON2_KERNEL_CONF}.tmp" "${PYTHON2_KERNEL_CONF}"; \
    apt-get remove -y jq; \
    #
    # Toree
    #
    jupyter toree install --spark_home=${SPARK_HOME}; \
    #
    # gosu installation (https://github.com/tianon/gosu#installation)
    #
    dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"; \
    wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-$dpkgArch"; \
    wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-$dpkgArch.asc"; \
    # Verify the signature
    GNUPGHOME="$(mktemp -d)"; \
    apt-get install -y --no-install-recommends gnupg2 dirmngr; \
    # Skip the verification step for now, the keyserver is very buggy
    # For flaky keyservers, consider https://github.com/tianon/pgp-happy-eyeballs, ala https://github.com/docker-library/php/pull/666
    # count=0; \
    # until (gpg2 --batch --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4) || ((count++ >= 10)); do \
        # echo "Cannot contact keyserver, trying again..." \
    # done; \
    # gpg2 --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu; \
    # command -v gpgconf && gpgconf --kill all || :; \
    rm -rf "${GNUPGHOME}" /usr/local/bin/gosu.asc; \
    # Clean up fetch dependencies
    chmod +x /usr/local/bin/gosu; \
    # Verify that the binary works
    gosu --version; \
    gosu nobody true; \
    apt-get remove -y gnupg2 dirmngr; \
    #
    # Remove unnecessary build-time only dependencies
    #
    apt-get remove -y wget; \
    rm -rf /var/lib/apt/lists/*




# include nice intro notebook
# COPY index.ipynb $HOME/notebooks/



# ENV NOTEBOOKS_DIR "/notebooks/"

EXPOSE 8888 8080 4040 4041 4042 4043 4044
CMD ["./run.sh"]
