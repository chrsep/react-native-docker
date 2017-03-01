FROM  ubuntu:latest

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install default-jdk -y
RUN apt-get install nodejs -y
RUN npm install -g react-native-cli
