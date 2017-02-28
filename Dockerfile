FROM  node:latest

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install openjdk-8-jdk -y
RUN npm install -g react-native-cli
