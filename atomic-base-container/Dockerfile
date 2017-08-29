FROM registry.access.redhat.com/rhel7-atomic

ENV APP_ROOT=/opt/app-root

RUN microdnf --enablerepo=rhel-7-server-rpms --enablerepo=rhel-server-rhscl-7-rpms --enablerepo=rhel-7-server-optional-rpms update \
             microdnf install nss_wrapper bind-utils gettext hostname && \
             microdnf clean all && \
             mkdir ${APP_ROOT}

COPY bin/ ${APP_ROOT}/bin/
COPY etc/ ${APP_ROOT}/etc/

RUN chmod -R u+x ${APP_ROOT}/bin && \
     chown -R 1001:0 ${APP_ROOT}

USER 1001
WORKDIR ${APP_ROOT}
ENV PATH=${APP_ROOT}/bin:${PATH} HOME=${APP_ROOT}

ENTRYPOINT [ "uid_entrypoint" ]
