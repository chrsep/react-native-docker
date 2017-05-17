FROM alpine:3.5

ENV ANDROID_COMPILE_SDK "23"
ENV ANDROID_BUILD_TOOLS "23.0.1"
ENV ANDROID_SDK_TOOLS "24.4.1"

ENV ANDROID_HOME=$PWD/android-sdk-linux
ENV PATH=$PATH:$PWD/android-sdk-linux/platform-tools/

RUN echo -e 'http://dl-cdn.alpinelinux.org/alpine/edge/main\nhttp://dl-cdn.alpinelinux.org/alpine/edge/community\nhttp://dl-cdn.alpinelinux.org/alpine/edge/testing' > /etc/apk/repositories
RUN apk add --no-cache openjdk8 nodejs wget unzip tar yarn bash

RUN yarn global add react-native-cli

RUN wget --quiet --output-document=android-sdk.tgz https://dl.google.com/android/android-sdk_r${ANDROID_SDK_TOOLS}-linux.tgz && \
    tar --extract --gzip --file=android-sdk.tgz && \
    rm android-sdk.tgz -fr

RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter android-${ANDROID_COMPILE_SDK} && \
          echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter platform-tools && \
          echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter build-tools-${ANDROID_BUILD_TOOLS} && \
          echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter build-tools-25.0.2 && \
          echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-android-m2repository && \
          echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-google-google_play_services && \
          echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-google-m2repository

RUN apk del wget unzip tar
