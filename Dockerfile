FROM  ubuntu:latest

RUN apt update && apt upgrade -y
RUN apt install default-jdk nodejs npm curl wget tar unzip lib32stdc++6 lib32z1 -y
RUN npm install -g react-native-cli yarn react-native-git-upgrade

RUN 
RUN  wget --quiet --output-document=android-sdk.tgz https://dl.google.com/android/android-sdk_r$24.4.1-linux.tgz
RUN tar --extract --gzip --file=android-sdk.tgz
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter android-23
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter platform-tools
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter build-tools-23.0.1
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter build-tools-25.0.2
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-android-m2repository
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-google-google_play_services
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-google-m2repository
RUN ln -s /usr/bin/nodejs /usr/bin/node
