# docker run -itd --name lede_build -p 10022:22 -v $PWD/lede:/home/user/openwrt p3terx/openwrt-build-env^
FROM alpine

WORKDIR /data/

ENV TS=Asia/Shanghai
ENV REPO_URL=https://github.com/Boos4721/openwrt
ENV REPO_BRANCH=master
ENV CONFIG_FILE=redmi_ax6.config

# prepare 
RUN sed -i 's/dl-cdn.alpinelinux.org/opentuna.cn/g' /etc/apk/repositories &&\
    apk add --no-cache \
      asciidoc bash bc binutils bzip2 cdrkit coreutils diffutils \
      findutils flex g++ gawk gcc gettext git grep intltool libxslt \
      linux-headers make ncurses-dev openssl-dev patch perl python2-dev \
      python3-dev rsync tar unzip util-linux wget zlib-dev \
      p7zip upx zstd curl

ENTRYPOINT "bash"

