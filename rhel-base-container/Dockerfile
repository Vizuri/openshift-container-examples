FROM registry.access.redhat.com/rhel7.4

LABEL name="marriott/base-uid" \
      version="1.0" \
      release="1" 

ENV APP_ROOT=/opt/app-root USER_NAME=default

RUN yum repolist > /dev/null && \
    yum install -y yum-utils && \
    yum-config-manager --disable \* &> /dev/null && \
    yum-config-manager --enable rhel-server-rhscl-7-rpms && \
    yum-config-manager --enable rhel-7-server-rpms && \
    yum-config-manager --enable rhel-7-server-optional-rpms && \
    yum -y update-minimal --disablerepo "*" --enablerepo rhel-7-server-rpms --setopt=tsflags=nodocs \
      --security --sec-severity=Important --sec-severity=Critical && \
    INSTALL_PKGS="nss_wrapper bind-utils gettext hostname" && \
    yum install -y --setopt=tsflags=nodocs $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    useradd ${USER_NAME} && \   
    mkdir ${APP_ROOT}

COPY bin/ ${APP_ROOT}/bin/
COPY etc/ ${APP_ROOT}/etc/
RUN chmod -R u+x ${APP_ROOT}/bin && \
     chown -R ${USER_NAME}:0 ${APP_ROOT}    

USER ${USER_NAME}
WORKDIR ${APP_ROOT}
ENV PATH=${APP_ROOT}/bin:${PATH} HOME=${APP_ROOT}

ENTRYPOINT [ "uid_entrypoint" ]
