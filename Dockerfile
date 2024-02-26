FROM linuxserver/code-server:latest
MAINTAINER bulzipke <bulzipke@naver.com>

ENV DEVKITPRO=/opt/devkitpro \
    DEVKITARM=/opt/devkitpro/devkitARM \
    DEVKITPPC/opt/devkitpro/devkitPPC

RUN apt-get update && apt-get install -y \
  python3 python3-venv python3-pip subversion ffmpeg wget zip && \
  ln -s /usr/bin/python3 /usr/bin/python && \
  pip install lz4 && \
  apt-get -y autoclean && apt-get -y autoremove && \
  rm -rf /var/lib/apt/lists/*
