FROM rhel-base-container:latest

USER root
RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash - \
    && yum install -y gcc-c++ make \
    && yum install -y nodejs \
    && yum clean all \
    && rm -rf /var/cache/yum  

USER ${USER_NAME}

COPY hello.js ${APP_ROOT}/

CMD node ${APP_ROOT}/hello.js
