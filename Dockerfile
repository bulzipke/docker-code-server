FROM linuxserver/code-server:latest

RUN apt-get update && apt-get install -y \
  python3 python3-venv python3-pip subversion && \
  apt-get -y autoclean && apt-get -y autoremove && \
  rm -rf /var/lib/apt/lists/*
