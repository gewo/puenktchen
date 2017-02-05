FROM debian:jessie
RUN apt-get update && apt-get install -y cmdtest
RUN mkdir /app
VOLUME /app
WORKDIR /app
CMD ["yarn", "README.yarn"]
