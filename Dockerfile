FROM  ubuntu:latest

ENV ANDROID_COMPILE_SDK "23"
ENV ANDROID_BUILD_TOOLS "23.0.1"
ENV ANDROID_SDK_TOOLS "24.4.1"

RUN apt update && apt upgrade -y
RUN apt install -y default-jdk \
                   nodejs \
                   npm \
                   curl \
                   wget \
                   tar \
                   unzip \
                   lib32stdc++6 \
                   lib32z1
RUN npm install -g react-native-cli yarn

RUN wget --quiet --output-document=android-sdk.tgz https://dl.google.com/android/android-sdk_r${ANDROID_SDK_TOOLS}-linux.tgz && \
    tar --extract --gzip --file=android-sdk.tgz

RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter android-${ANDROID_COMPILE_SDK}
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter platform-tools
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter build-tools-${ANDROID_BUILD_TOOLS}
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter build-tools-25.0.2
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-android-m2repository
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-google-google_play_services
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-google-m2repository

ENV ANDROID_HOME=$PWD/android-sdk-linux
ENV PATH=$PATH:$PWD/android-sdk-linux/platform-tools/
RUN ln -s /usr/bin/nodejs /usr/bin/node
