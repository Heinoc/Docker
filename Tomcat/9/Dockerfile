FROM heinoc/java:1.8

MAINTAINER heinoc <tracychsh@126.com>


RUN set -eux \
	&& cd /home/work/temp \
# -----------------------------------------------------------------------------
# 下载安装包
# -----------------------------------------------------------------------------
	&& wget -O tomcat9.tar.gz "http://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-9/v9.0.1/bin/apache-tomcat-9.0.1.tar.gz" \
	&& tar -C /home/work/app -xzf tomcat9.tar.gz \
# -----------------------------------------------------------------------------
# 删除安装包
# -----------------------------------------------------------------------------
	&& rm -rf /home/work/temp/*


# -----------------------------------------------------------------------------
# 修改 tomcat-users.xml 配置文件，启用admin用户
# -----------------------------------------------------------------------------
ADD conf/tomcat-users.xml /home/work/app/apache-tomcat-9.0.1/conf/tomcat-users.xml
ADD META-INF/context.xml /home/work/app/apache-tomcat-9.0.1/webapps/manager/META-INF/context.xml
ADD META-INF/context.xml /home/work/app/apache-tomcat-9.0.1/webapps/host-manager/META-INF/context.xml


# -----------------------------------------------------------------------------
# 配置tomcat环境变量
# -----------------------------------------------------------------------------
ENV CATALINA_HOME   /home/work/app/apache-tomcat-9.0.1


EXPOSE 8080


CMD ["/home/work/app/apache-tomcat-9.0.1/bin/catalina.sh", "run"]