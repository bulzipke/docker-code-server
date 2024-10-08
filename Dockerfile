FROM linuxserver/code-server:latest
MAINTAINER bulzipke <bulzipke@naver.com>

ENV DEVKITPRO=/opt/devkitpro \
  DEVKITARM=/opt/devkitpro/devkitARM \
  DEVKITPPC=/opt/devkitpro/devkitPPC \
  CTRULIB=/opt/devkitpro/libctru
  
COPY vim_config /root/
 
RUN apt-get update && apt-get install -y \
  python3 python3-venv python3-pip subversion ffmpeg wget zip vim \
  libsdl2-dev libsdl2-mixer-dev libfreeimage-dev libfreetype6-dev \
  libcurl4-openssl-dev rapidjson-dev libasound2-dev libgl1-mesa-dev build-essential \
  libboost-all-dev cmake fonts-droid-fallback libvlc-dev libvlccore-dev vlc-bin libint-dev gettext cpio rsync bc && \
  ln -s /usr/bin/python3 /usr/bin/python && \
  wget https://apt.devkitpro.org/install-devkitpro-pacman && \
  chmod +x ./install-devkitpro-pacman && \
  yes | ./install-devkitpro-pacman && \
  rm install-devkitpro-pacman && \
  dkp-pacman -S --needed --noconfirm switch-dev switch-glm switch-libjpeg-turbo devkitARM devkitarm-rules hactool nds-dev 3ds-dev && \
  pip install lz4 --break-system-packages && \
  apt-get -y autoclean && apt-get -y autoremove && \
  rm -rf /var/lib/apt/lists/*
