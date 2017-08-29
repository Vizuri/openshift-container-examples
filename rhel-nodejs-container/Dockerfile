FROM marriott/rhel-base-container:1.0

USER root
RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash - \
    && yum install -y gcc-c++ make \
    && yum install -y nodejs \
    && yum clean all \
    && rm -rf /var/cache/yum  

USER 1001

COPY hello.js ${APP_ROOT}/

CMD node ${APP_ROOT}/hello.js
