FROM node:0.10.38
MAINTAINER Nathan LeClaire <nathan@docker.com>

ADD . /app
WORKDIR /app
RUN npm install
RUN apt-get update
RUN apt-get install -y vim aptitude
RUN useradd -m -s /bin/bash ysc
RUN adduser ysc sudo
RUN echo 'ysc:ysc' | chpasswd

EXPOSE 80

ENTRYPOINT ["node"]
CMD ["app.js", "-p", "80"]
