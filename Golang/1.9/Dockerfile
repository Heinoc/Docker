FROM heinoc/nginx:1.8.1

MAINTAINER heinoc <tracychsh@126.com>



RUN set -eux \
    && mkdir /home/work/temp \
	&& cd /home/work/temp \
# -----------------------------------------------------------------------------
# 下载golang安装包
# -----------------------------------------------------------------------------
	&& wget -O go1.9.tar.gz "https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz" \
	&& tar -C /home/work/app -xzf go1.9.tar.gz \
# -----------------------------------------------------------------------------
# 创建GOPATH
# -----------------------------------------------------------------------------
	&& cd /home/work/src \
	&& mkdir golang\
# -----------------------------------------------------------------------------
# 配置golang环境变量
# -----------------------------------------------------------------------------
    && echo "export PATH=\$PATH:/home/work/app/go/bin" >> /etc/profile \
    && echo "export PATH=\$PATH:/home/work/app/go/bin" >> ~/.bash_profile \
    && echo "export GOPATH=/home/work/src/golang" >> ~/.bash_profile \
    && echo "export GOBIN=/home/work/app/go" >> ~/.bash_profile \
# -----------------------------------------------------------------------------
# 删除golang安装包
# -----------------------------------------------------------------------------
	&& rm -rf /home/work/temp/go.tgz
