FROM linuxserver/code-server:latest
MAINTAINER bulzipke <bulzipke@naver.com>

ENV DEVKITPRO=/opt/devkitpro \
  DEVKITARM=/opt/devkitpro/devkitARM \
  DEVKITPPC=/opt/devkitpro/devkitPPC
 
RUN apt-get update && apt-get install -y \
  python3 python3-venv python3-pip subversion ffmpeg wget zip && \
  ln -s /usr/bin/python3 /usr/bin/python && \
  wget https://apt.devkitpro.org/install-devkitpro-pacman && \
  chmod +x ./install-devkitpro-pacman && \
  yes | ./install-devkitpro-pacman && \
  rm install-devkitpro-pacman && \
  dkp-pacman -S --needed --noconfirm switch-dev switch-glm switch-libjpeg-turbo devkitARM devkitarm-rules hactool nds-dev && \
  pip install lz4 && \
  apt-get -y autoclean && apt-get -y autoremove && \
  rm -rf /var/lib/apt/lists/*
