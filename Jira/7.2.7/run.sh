#!/bin/bash


# 启动 supervisord
service supervisord start
# 启动 sshd
service sshd start

# outpu log
tail -F /home/work/logs/supervisord/supervisord.log