FROM heinoc/nginx:1.8.1

MAINTAINER heinoc <tracychsh@126.com>


ADD go1.9.src.tar.gz /home/work/temp/

RUN cd /home/work/temp && ls && echo "=====" && pwd

# -----------------------------------------------------------------------------
# 下载 golang
# -----------------------------------------------------------------------------
RUN set -eux \
#	&& cd /home/work/temp \
#	&& tar -C /home/work/app -xzf /home/work/temp/go1.9.src.tar.gz \
    && mv /home/work/temp/go /home/work/app/go \
	&& cd /home/work/app/go/src \
	&& ./all.bash \
	&& export GOPATH=/home/work/src/golang \
	&& export GOROOT=/home/work/app/go \
	&& export GOOS="$(/home/work/app/go/bin/go env GOOS)" \
	&& export GOARCH="$(/home/work/app/go/bin/go env GOARCH)" \
	&& export GO386="$(/home/work/app/go/bin/go env GO386)" \
	&& export GOARM="$(/home/work/app/go/bin/go env GOARM)" \
	&& export GOHOSTOS="$(/home/work/app/go/bin/go env GOHOSTOS)" \
	&& export GOHOSTARCH="$(/home/work/app/go/bin/go env GOHOSTARCH)" \
	&& export GOROOT_BOOTSTRAP=/home/work/app/go \
	&& export GOBIN=$GOROOT/bin \
	&& GOOS=linux GOARCH=ppc64 ./bootstrap.bash \
	&& ./make.bash \
	&& cd /home/work/app \
	&& rm -rf /home/work/app/go-linux-amd64-bootstrap.tbz \
	&& rm -rf /home/work/temp/*

ENV GOPATH /home/work/src/golang
ENV GOROOT /home/work/app/go
ENV GOBIN $GOROOT/bin
ENV PATH /home/work/app/go/bin:/usr/local/sbin:$PATH