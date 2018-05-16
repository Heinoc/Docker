
# Jira7.3.3-Java1.8-CentOS7.4


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`heinoc/java:1.8`](https://hub.docker.com/r/heinoc/java/)
- [`heinoc/centos:7.4`](https://hub.docker.com/r/heinoc/centos/)


## Developing

```bash
# Run
docker run -it -d --name=jira heinoc/jira:7.3.3 /bin/bash
```


## Note

启动Jira需要进入container，手动执行jira-init.sh文件，然后手动启动Jira
```bash
service jira start
```

如果发现汉化插件无法使用，建议重启一下Jira试一下，或者删除汉化包，重新上传。


汉化后如果发现DashBoard页有中文乱码，解决办法如下：
```
1.在jira安装文件夹下bin目录找到setenv.sh文件

2.文件找到JVM_SUPPORT_RECOMMENDED_ARGS=

3.修改JVM_SUPPORT_RECOMMENDED_ARGS="-Dfile.encoding=utf8"

4.重启Jira
```