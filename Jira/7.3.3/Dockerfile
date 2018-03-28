FROM heinoc/java:1.8

MAINTAINER heinoc <tracychsh@126.com>



# -----------------------------------------------------------------------------
# 安装 expect 工具
# -----------------------------------------------------------------------------
RUN yum makecache fast\
    && yum install -y tcl expect


# -----------------------------------------------------------------------------
# 下载jira
# -----------------------------------------------------------------------------
RUN axel -n 10 -o /home/work/temp/ https://downloads.atlassian.com/software/jira/downloads/atlassian-jira-software-7.3.3-x64.bin \
    && cd /home/work/temp \
    && chmod 755 atlassian-jira-software-7.3.3-x64.bin \
    && mkdir /home/work/script/ \
# -----------------------------------------------------------------------------
# 删除多余文件
# -----------------------------------------------------------------------------
    && yum clean all



# -----------------------------------------------------------------------------
# 复制文件
# -----------------------------------------------------------------------------
#hack
COPY files/atlassian-extras-3.2.jar /home/work/temp/jira-extras
#mysql driver
COPY files/mysql-connector-java-5.1.39-bin.jar /home/work/temp/jira-extras

# -----------------------------------------------------------------------------
# 复制安装命令
# -----------------------------------------------------------------------------
COPY files/jira/jira-install.sh /home/work/script/jira-install.sh
COPY files/jira/jira-init.sh /home/work/script/jira-init.sh


RUN chmod 777 /home/work/script/jira-install.sh
RUN chmod 777 /home/work/script/jira-init.sh



# Define data volumes
VOLUME ["/opt/atlassian", "/var/atlassian"]


# -----------------------------------------------------------------------------
# 映射端口
# -----------------------------------------------------------------------------
EXPOSE 8080 8085 8443 8090

CMD ["/home/work/script/jira-init.sh"]

