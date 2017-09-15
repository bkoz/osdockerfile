#
# Dockerfile
#
# FROM registry.access.redhat.com/rhel7:latest
FROM docker.io/openshift/base-centos7
MAINTAINER Bob Kozdemba <bkozdemba@gmail.com>
EXPOSE 8080
RUN yum -y install rng-tools bind-utils httpd php php-mysql && yum clean all -y
RUN sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf && \
    sed -i 's/variables_order = "GPCS"/variables_order = "EGPCS"/' /etc/php.ini
RUN curl -L https://raw.githubusercontent.com/bkoz/osdockerfile/master/index.php -o /var/www/html/phptest.php
RUN chmod a+rw /var/www/html/phptest.php
RUN echo "Sample pages at test.html and phptest.php"
RUN echo "Sample page is test.html" >> /var/www/html/test.html
RUN chmod -R a+rwx /run/httpd /etc/httpd/logs

# OSE ignores uid. Image should work with any, that's why rwx above
USER 1001
CMD /bin/bash -c 'echo Starting Microservice... ; \
env ;\
/usr/sbin/httpd -DFOREGROUND || echo Apache start failed: $?'
