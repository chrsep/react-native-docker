FROM  ubuntu:latest
RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update
RUN apt-get install openjdk-8-jdk
RUN apt-get install nodejs
RUN npm install react-native-cli
