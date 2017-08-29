FROM marriott/atomic-base-container:1.0

USER root
RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash - \
    && microdnf --enablerepo=rhel-7-server-rpms --enablerepo=rhel-server-rhscl-7-rpms --enablerepo=rhel-7-server-optional-rpms install -y gcc-c++ make \
    && microdnf install -y nodejs \
    && microdnf clean all 

USER 1001

COPY hello.js ${APP_ROOT}/

CMD node ${APP_ROOT}/hello.js
