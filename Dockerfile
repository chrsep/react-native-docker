FROM  ubuntu:latest

RUN apt update && apt upgrade -y
RUN apt install default-jdk nodejs npm curl wget tar unzip lib32stdc++6 lib32z1 -y
RUN npm install -g react-native-cli yarn react-native-git-upgrade
