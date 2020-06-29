FROM linuxserver/code-server:latest

RUN apt-get update && apt-get install -y \
  gcc g++ gdb libboost-all-dev \
  libgdk-pixbuf2.0-dev python-pip cmake libx11-dev libxmu-dev libglu1-mesa-dev libgl2ps-dev libxi-dev libzip-dev libpng-dev libcurl4-gnutls-dev libfontconfig1-dev libsqlite3-dev libglew-dev libssl-dev libgtk-3-dev libglfw3 libglfw3-dev xorg-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
