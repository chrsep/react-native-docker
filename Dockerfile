FROM  ubuntu:latest

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install openjdk-8-jdk -y
RUN apt-get install nodejs -y
RUN npm install react-native-cli
