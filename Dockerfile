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
CMD /usr/bin/tail -f /dev/null

