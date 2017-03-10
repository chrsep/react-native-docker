FROM  ubuntu:latest

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

RUN apt update && apt upgrade -y
RUN apt install default-jdk nodejs npm curl yarn -y
RUN yarn global add react-native-cli
