FROM heinoc/centos:7

MAINTAINER heinoc <tracychsh@126.com>

#ADD jdk-8u144-linux-x64.tar.gz /home/work/temp

RUN set -eux \
    && cd /home/work/temp \
# -----------------------------------------------------------------------------
# 下载jdk1.8安装包
# -----------------------------------------------------------------------------
    && wget -O jdk8.tar.gz "http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.tar.gz" \
    && tar -C /home/work/app -xzf jdk8.tar.gz \

# -----------------------------------------------------------------------------
# Java环境变量配置
# -----------------------------------------------------------------------------
    && echo "export JAVA_HOME=/home/work/app/jdk1.8.0_144" >> /etc/profile \
    && echo "export JRE_HOME=\$JAVA_HOME/jre" >> /etc/profile \
    && echo "export PATH=\$PATH:\$JAVA_HOME/bin:\$JRE_HOME/bin" >> /etc/profile \
    && echo "export CLASSPATH=.:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar" >> /etc/profile \

    && echo "export JAVA_HOME=/home/work/app/jdk1.8.0_144" >> ~/.bash_profile \
    && echo "export JRE_HOME=\$JAVA_HOME/jre" >> ~/.bash_profile \
    && echo "export PATH=\$PATH:\$JAVA_HOME/bin:\$JRE_HOME/bin" >> ~/.bash_profile \
    && echo "export CLASSPATH=.:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar" >> ~/.bash_profile \
    && ls






#
#RUN set -eux \
#	&& cd /home/work/temp \
## -----------------------------------------------------------------------------
## 下载golang安装包
## -----------------------------------------------------------------------------
#	&& wget -O go1.9.tar.gz "https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz" \
#	&& tar -C /home/work/app -xzf go1.9.tar.gz \
## -----------------------------------------------------------------------------
## 创建GOPATH目录
## -----------------------------------------------------------------------------
#	&& cd /home/work/src \
#	&& mkdir golang \
#	&& cd golang \
#	&& mkdir bin \
#	&& mkdir pkg \
#	&& mkdir src \
## -----------------------------------------------------------------------------
## 配置golang环境变量
## -----------------------------------------------------------------------------
#    && echo "export PATH=\$PATH:/home/work/app/go/bin" >> /etc/profile \
#    && echo "export PATH=\$PATH:/home/work/app/go/bin" >> ~/.bash_profile \
#    && echo "export GOPATH=/home/work/src/golang" >> ~/.bash_profile \
#    && echo "export GOBIN=/home/work/app/go" >> ~/.bash_profile \
## -----------------------------------------------------------------------------
## 删除golang安装包
## -----------------------------------------------------------------------------
#	&& rm -rf /home/work/temp/go.tgz
