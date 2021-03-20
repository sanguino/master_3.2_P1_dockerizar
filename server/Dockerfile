FROM node:lts

ENV RABBIT_USER
ENV RABBIT_PASS
ENV RABBIT_HOST
ENV RABBIT_PORT

ENV MYSQL_DBNAME
ENV MYSQL_HOST
ENV MYSQL_PORT
ENV MYSQL_PASS
ENV MYSQL_PASS

ENV NODE_ENV production
WORKDIR /usr/src/app

RUN curl -LJO https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh \
&& chmod +x ./wait-for-it.sh

COPY package*.json /usr/src/app/
RUN npm ci

COPY src/ /usr/src/app/src
COPY config/ /usr/src/app/config
COPY public/ /usr/src/app/public

CMD ["node", "src/server.js"]