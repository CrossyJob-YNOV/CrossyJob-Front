FROM node:12-alpine3.9

CMD "cd app"

COPY ["package.json", "./"]
RUN npm install

COPY [".", "."]

RUN npm build
RUN npm start