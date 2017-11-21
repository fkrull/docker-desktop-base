ARG BASE_IMAGE=debian
ARG TAG=stretch

FROM ${BASE_IMAGE}:${TAG}
ARG DISPLAY=:0
ARG USER=pi

ENV DEBIAN_FRONTEND=noninteractive
ADD apt-pins /etc/apt/preferences.d/apt-pins
ADD debconf /debconf
RUN debconf-set-selections < /debconf && rm /debconf

RUN apt-get update && \
    apt-get install -y \
        dbus \
        gnupg \
        less \
        lsb-release \
        sudo \
        vim \
        xserver-xorg \
        xterm \
        && \
    rm -rf /var/lib/apt/lists/*

RUN useradd --create-home --shell=/bin/bash --groups=audio,sudo ${USER} && \
    echo "${USER} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nopasswd && \
    chmod 0400 /etc/sudoers.d/nopasswd
WORKDIR /home/${USER}
VOLUME /home

ENV DISPLAY=${DISPLAY}
ENV USER=${USER}
ENV KEYMAP=us

ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 0755 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/bin/xterm"]
