FROM linuxserver/code-server:latest

RUN apt-get update && apt-get install -y && \
  gcc && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
