
# Tomcat9.0.1-Java1.8-CentOS7.4


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`heinoc/java:1.8`](https://hub.docker.com/r/heinoc/java/)


## Developing

```bash
# 第一种方案
docker run -it --rm -p 8080:8080 --name=tom heinoc/tomcat:7

## 打开浏览器，访问http://localhost:8080，如果能够进入tomcat，则tomcat启动成功。



# 第二种方案
## Run
docker run -it -d -p 8080:8080 --name=tom heinoc/tomcat:9 /bin/bash

## 进入容器
docker exec -it tom /bin/bash
## 进入tomcat bin目录
cd $CATALINA_HOME/bin/
## 启动tomcat
./startup.sh

## 打开浏览器，访问http://localhost:8080，如果能够进入tomcat，则tomcat启动成功。

```
