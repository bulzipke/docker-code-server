FROM linuxserver/code-server:latest

ENV ANT_ROOT /usr/bin/ant
ENV NDK_ROOT /opt/android-ndk
ENV ANDROID_SDK_ROOT /opt/android-sdk
ENV PATH="$ANDROID_SDK_ROOT/tools/bin:${PATH}"

RUN apt-get update && apt-get install -y \
  gcc g++ gdb libboost-all-dev \
  ant libgdk-pixbuf2.0-dev python-pip cmake libx11-dev libxmu-dev libglu1-mesa-dev libgl2ps-dev libxi-dev libzip-dev libpng-dev libcurl4-gnutls-dev libfontconfig1-dev libsqlite3-dev libglew-dev libssl-dev libgtk-3-dev libglfw3 libglfw3-dev xorg-dev && \
  cd /opt && \
  ANDROID_NDK=$(curl -sX GET "https://developer.android.com/ndk/downloads" | grep href | grep -m 1 linux-x86_64 | sed "s/.*=\"//g" | sed "s/\".*//g") && \
  curl -o android_ndk.zip -L ${ANDROID_NDK} && \
  unzip android_ndk.zip && \
  rm android_ndk.zip && \
  mv android-ndk* android-ndk && \
  mkdir -p /opt/android-sdk && cd /opt/android-sdk && \
  ANDROID_SDK=$(curl -sX GET "https://developer.android.com/studio" | grep latest.zip | grep linux | grep https | sed "s/.*=\"//g" | sed "s/\"//g") && \
  curl -o android_sdk.zip -L ${ANDROID_SDK} && \
  unzip android_sdk.zip && \
  rm android_sdk.zip && \
  sdkmanager --licenses && \
  apt-get purge -y unzip && apt-get -y autoclean && apt-get -y autoremove && \
  rm -rf /var/lib/apt/lists/*
