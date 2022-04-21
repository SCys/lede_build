FROM debian:bullseye

WORKDIR /data/

ENV TS=Asia/Shanghai
ENV REPO_URL=https://github.com/Boos4721/openwrt
ENV REPO_BRANCH=master
ENV CONFIG_FILE=redmi_ax6.config

RUN sed -i -E 's/(deb|security).debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    apt update -y -qq && apt upgrade -y -qq && \
    apt install -y -qq \
        ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential \
        bzip2 ccache cmake cpio curl device-tree-compiler fastjar flex gawk gettext gcc-multilib g++-multilib \
        git gperf haveged help2man intltool libc6-dev-i386 libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev \
        libmpc-dev libmpfr-dev libncurses5-dev libncursesw5-dev libreadline-dev libssl-dev libtool lrzsz \
        mkisofs msmtp nano ninja-build p7zip p7zip-full patch pkgconf python2.7 python3 python3-pip qemu-utils \
        rsync scons squashfs-tools subversion swig texinfo uglifyjs upx-ucl unzip vim-nox wget xmlto xxd zlib1g-dev xz-utils \
    && rm -rf /var/lib/apt/lists/*

RUN addgroup -S scys --gid 1000 && adduser -S scys -G scys --uid 1000

USER scys

CMD ["bash", "build.sh"]

