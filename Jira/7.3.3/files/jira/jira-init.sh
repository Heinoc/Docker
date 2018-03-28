#!/bin/bash


fileName="/opt/atlassian/jira/bin/bootstrap.jar"

# -----------------------------------------------------------------------------
# 判断文件是否存在
# -----------------------------------------------------------------------------
if [ ! -f "$fileName" ]
then
# -----------------------------------------------------------------------------
# 初始化 JIRA 的安装
# -----------------------------------------------------------------------------
    expect /home/work/script/jira-install.sh \
    && cd /home/work/temp \
    && echo "copy atlassian-extras-3.2.jar to /opt/atlassian/jira/atlassian-jira/WEB-INF/lib/atlassian-extras-3.2.jar" \
    && \cp -f /home/work/temp/jira-extras/atlassian-extras-3.2.jar /opt/atlassian/jira/atlassian-jira/WEB-INF/lib/atlassian-extras-3.2.jar \
    && echo "copy mysql-connector-java-5.1.39-bin.jar to /opt/atlassian/jira/atlassian-jira/WEB-INF/lib/mysql-connector-java-5.1.39-bin.jar" \
    && \cp -f /home/work/temp/jira-extras/mysql-connector-java-5.1.39-bin.jar /opt/atlassian/jira/atlassian-jira/WEB-INF/lib/mysql-connector-java-5.1.39-bin.jar \
    && service jira stop \
    && service jira start
else
# -----------------------------------------------------------------------------
# 如果 JIRA 用户和用户组不存在则创建
# -----------------------------------------------------------------------------
    user=jira
    group=jira
    egrep "^$group" /etc/group >& /dev/null
    if [ $? -ne 0 ]
    then
        groupadd $group
    fi
    egrep "^$user" /etc/passwd >& /dev/null
    if [ $? -ne 0 ]
    then
        useradd -g $group $user
    fi

# -----------------------------------------------------------------------------
# 停止服务，并重新启动
# -----------------------------------------------------------------------------
    service jira stop
    service jira start
fi