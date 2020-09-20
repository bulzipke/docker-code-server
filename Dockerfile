FROM linuxserver/code-server:latest

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV ANT_ROOT /usr/bin/ant

RUN apt-get update && apt-get install -y \
  gcc g++ gdb libboost-all-dev \
  ant libgdk-pixbuf2.0-dev python-pip python3-pip cmake libx11-dev libxmu-dev libglu1-mesa-dev libgl2ps-dev libxi-dev libzip-dev libpng-dev libcurl4-gnutls-dev libfontconfig1-dev libsqlite3-dev libglew-dev libssl-dev libgtk-3-dev libglfw3 libglfw3-dev xorg-dev openjdk-8-jdk ninja-build && \
  apt-get -y autoclean && apt-get -y autoremove && \
  rm -rf /var/lib/apt/lists/*
