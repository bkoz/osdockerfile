# osdockerfile
A Simple OpenShift Dockerfile example

$ docker build --rm=true --tag=php .

Run the mysql and php container.

$ docker run -d --name mysql -e MYSQL_USER=user -e MYSQL_PASSWORD=pass -e MYSQL_DATABASE=db -p 3306:3306 registry.access.redhat.com/rhscl/mysql-56-rhel7

$ docker run -d -p 8080:8080 --name php --link mysql:mysql php

Clean up.

$ docker stop php mysql
$ docker rm php mysql
$ docker rmi php 

