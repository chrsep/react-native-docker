FROM  ubuntu:latest
RUN apt-get install openjdk-8-jdk
RUN apt-get install nodejs
RUN npm install react-native-cli
