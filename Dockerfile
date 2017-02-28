FROM  node:latest

RUN apt-get update
RUN apt-get install software-properties-common -y
RUN sudo add-apt-repository ppa:openjdk-r/ppa 
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install openjdk-8-jdk -y
RUN npm install -g react-native-cli
