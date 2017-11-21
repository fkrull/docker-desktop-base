FROM debian:stretch
ARG DISPLAY=:0
ENV DISPLAY=${DISPLAY}

ADD apt-pins /etc/apt/preferences.d/apt-pins
ADD debconf /debconf
RUN debconf-set-selections < /debconf && rm /debconf
RUN apt-get update && \
    apt-get install -yy sudo xserver-xorg xterm && \
    rm -rf /var/lib/apt/lists/*

RUN useradd --create-home --shell /bin/bash pi
ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 0755 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/bin/bash"]
