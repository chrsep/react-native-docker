FROM  ubuntu:latest

RUN apt update && apt upgrade -y
RUN apt install default-jdk nodejs npm curl -y
RUN yarn global add react-native-cli
