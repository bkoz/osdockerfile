# osdockerfile
A Simple RHEL/apache/php Dockerfile example

Build the RHEL/apache/php container.

$ docker build --rm=true --tag=php .

Run and link the mysql and php containers.

$ docker run -d --name mysql -e MYSQL_USER=user -e MYSQL_PASSWORD=pass -e MYSQL_DATABASE=db -p 3306:3306 registry.access.redhat.com/rhscl/mysql-56-rhel7

$ docker run -d -p 8080:8080 --name php --link mysql:mysql php

Get the IP address and visit the php application.

$ ip=`docker inspect --format={{.NetworkSettings.IPAddress}} php`

$ curl http://$ip:8080 

$ lynx http://$ip:8080 

Clean up.

$ docker stop php mysql
$ docker rm php mysql
$ docker rmi php 

