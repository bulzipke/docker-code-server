FROM linuxserver/code-server:latest

RUN apt-get update && apt-get install -y \
  gcc g++ gdb libboost-all-dev \
  libcurl4-openssl-dev \
  python3-pip cmake && \
  apt-get -y autoclean && apt-get -y autoremove && \
  rm -rf /var/lib/apt/lists/*
