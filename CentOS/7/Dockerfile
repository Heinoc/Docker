FROM centos:7

MAINTAINER heinoc <tracychsh@126.com>


#
## -----------------------------------------------------------------------------
## UTF-8
## -----------------------------------------------------------------------------
#RUN timedatectl list-timezones
#RUN localectl list-locales |grep utf8
#
#RUN localectl set-locale LANG=en_GB.utf8 \
#    localectl set-keymap en_GB
#
#
#
## -----------------------------------------------------------------------------
## 设置时区
## -----------------------------------------------------------------------------
#RUN timedatectl set-timezone Asia/Shanghai \
#    timedatectl set-time YYYY-MM-DD \
#    timedatectl set-time HH:MM:SS


# -----------------------------------------------------------------------------
# 创建work用户
# -----------------------------------------------------------------------------
RUN useradd -r -m work \
    && echo "work:123456" | chpasswd \
    && echo "root:123456" | chpasswd

RUN cd /home/work \
    && mkdir _src

# -----------------------------------------------------------------------------
# 设置work目录的用户和用户组
# -----------------------------------------------------------------------------
RUN chown -R work:work /home/work/*




# -----------------------------------------------------------------------------
# 安装 axel 多线程下载工具
# -----------------------------------------------------------------------------
ADD axel-2.4-1.el6.rf.x86_64.rpm /home/work/_src/
ADD axelget.conf /etc/yum/pluginconf.d/
ADD axelget.py /usr/lib/yum-plugins/
RUN cd /home/work/_src \
    && rpm -ivh axel-2.4-1.el6.rf.x86_64.rpm

# -----------------------------------------------------------------------------
# 更改源为阿里云
# -----------------------------------------------------------------------------
RUN yum install -y wget \
#    && cd /etc/yum.repos.d/ \
#    && mv CentOS-Base.repo CentOS-Base.repo.bak \
#    && wget -O CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo \
#    && wget http://mirrors.163.com/.help/CentOS6-Base-163.repo \
    && yum clean all \
    && yum makecache

# -----------------------------------------------------------------------------
# 安装基础组件
# -----------------------------------------------------------------------------
RUN yum install -y wget python-setuptools iputils bash-completion \
    && yum install -y net-tools vim arping \
    && yum install -y zlib zlib-devel openssl openssl--devel openssh-clients pcre pcre-devel libtool \
    && yum install -y tar unzip man cmake patch lsof \
    && yum install -y cyrus-sasl-plain cyrus-sasl cyrus-sasl-devel cyrus-sasl-lib \
    && yum install -y autoconf file gcc gcc-c++ make pkg-config re2c pkg-config




# -----------------------------------------------------------------------------
# Define working directory.
# -----------------------------------------------------------------------------
WORKDIR /home/work



# -----------------------------------------------------------------------------
# 映射端口
# -----------------------------------------------------------------------------
EXPOSE 22