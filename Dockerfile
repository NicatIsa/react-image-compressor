FROM node:14-buster-slim
WORKDIR /usr/app
COPY . .
RUN npm install
EXPOSE 3000
