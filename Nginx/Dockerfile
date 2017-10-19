FROM heinoc/centos:7.4

MAINTAINER heinoc <tracychsh@126.com>



RUN yum install gcc-c++
RUN yum -y install pcre pcre-devel
RUN yum -y install zlib zlib-devel
RUN yum install -y openssl openssl-devel




#RUN wget -c -P /home/work/temp/ https://nginx.org/download/nginx-1.10.3.tar.gz
#
#
#RUN pwd
#RUN cd src \
#    && tar -zxvf nginx-1.10.3.tar.gz \
#    && cd /home/work/temp/nginx-1.10.3 \
#    && ./configure \
#    && make \
#    && make install \
## -----------------------------------------------------------------------------
## 删除多余文件
## -----------------------------------------------------------------------------
#    && yum clean all \
#    && rm -rf /home/work/temp/*



ADD tengine-2.2.0.zip /home/work/temp


# -----------------------------------------------------------------------------
#   安装tengine
# -----------------------------------------------------------------------------
RUN cd /home/work/temp/ \
    && unzip tengine-2.2.0.zip \
    && cd tengine-tengine-2.2.0 \
    && ./configure --prefix=/home/work/app/nginx \
    && make \
    && make install \
# -----------------------------------------------------------------------------
#   设置环境变量
# -----------------------------------------------------------------------------
    && echo "export PATH=\$PATH:/home/work/app/nginx/sbin" >> /etc/profile \
    && echo "export PATH=\$PATH:/home/work/app/nginx/sbin" >> ~/.bash_profile \
    && sed -i "s/#user  nobody;/user  work;/" /home/work/app/nginx/conf/nginx.conf \
    \
# -----------------------------------------------------------------------------
# 删除多余文件
# -----------------------------------------------------------------------------
    && yum clean all \
    && rm -rf /home/work/temp/*



# -----------------------------------------------------------------------------
# 修改 Nginx 的配置文件，并配置默认站点
# -----------------------------------------------------------------------------
ADD app/nginx/conf/nginx.conf /home/work/app/nginx/conf/nginx.conf
ADD app/nginx/conf/conf.d/default.conf /home/work/app/nginx/conf/conf.d/default.conf

# -----------------------------------------------------------------------------
# 映射端口
# -----------------------------------------------------------------------------
EXPOSE 80

# -----------------------------------------------------------------------------
# 添加执行文件
# -----------------------------------------------------------------------------
ADD run.sh /
RUN chmod +x /run.sh
ENTRYPOINT /usr/sbin/init
CMD ["/run.sh"]