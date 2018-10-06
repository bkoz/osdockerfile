#
# Dockerfile
#
FROM docker.io/openshift/base-centos7
MAINTAINER Bob Kozdemba <bkozdemba@gmail.com>
EXPOSE 8080
RUN yum -y install git wget && yum clean all -y
RUN wget -O /usr/tmp/oc.tar.gz https://mirror.openshift.com/pub/openshift-v3/clients/3.10.51/linux/oc.tar.gz
RUN tar xf /usr/tmp/oc.tar.gz && mv oc /usr/local/bin && rm /usr/tmp/oc.tar.gz
# OSE ignores uid. Image should work with any, that's why rwx above
# USER 0
# CMD /bin/bash -c 'echo Starting Microservice... ; \
# env ;\
# /usr/sbin/httpd -DFOREGROUND || echo Apache start failed: $?'
#
# Reference: https://github.com/RHsyseng/container-rhel-examples/blob/master/starter-arbitrary-uid/Dockerfile
#
### Setup user for build execution and application runtime
ENV APP_ROOT=/opt/app-root
RUN mkdir -p ${APP_ROOT}
ENV PATH=${APP_ROOT}/bin:${PATH} HOME=${APP_ROOT}
# COPY bin/ ${APP_ROOT}/bin/
RUN chmod -R u+x ${APP_ROOT}/bin && \
    chgrp -R 0 ${APP_ROOT} && \
    chmod -R g=u ${APP_ROOT} /etc/passwd

### Containers should NOT run as root as a good practice
USER 10001
WORKDIR ${APP_ROOT}

### user name recognition at runtime w/ an arbitrary uid - for OpenShift deployments
ENTRYPOINT [ "uid_entrypoint" ]
VOLUME ${APP_ROOT}/logs ${APP_ROOT}/data
# CMD run
CMD /usr/bin/tail -f /dev/null

