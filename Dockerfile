FROM linuxserver/code-server:latest

RUN apt-get update && apt-get install -y \
  gcc g++ gdb libboost-all-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
