FROM heinoc/centos:7.4

MAINTAINER heinoc <tracychsh@126.com>

#使用本地安装包
#ADD jdk-8u144-linux-x64.tar.gz /home/work/app


RUN set -eux \
#下载在线安装包
    && cd /home/work/temp \
# -----------------------------------------------------------------------------
# 下载jdk1.8安装包
# -----------------------------------------------------------------------------
    && wget -O jdk8.tar.gz  --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.tar.gz" \
    && tar xvf jdk8.tar.gz -C /home/work/app \

# -----------------------------------------------------------------------------
# 删除jdk1.8安装包
# -----------------------------------------------------------------------------
	&& rm -rf /home/work/temp/*


# -----------------------------------------------------------------------------
# Java环境变量配置
# -----------------------------------------------------------------------------
ENV JAVA_HOME   /home/work/app/jdk1.8.0_144
ENV JRE_HOME    $JAVA_HOME/jre
ENV PATH    $PATH:$JAVA_HOME/bin:$JRE_HOME/bin
ENV CLASSPATH   .:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar


