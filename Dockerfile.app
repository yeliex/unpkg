FROM node:8

COPY package.json yarn.lock ./
RUN yarn --pure-lockfile
COPY . .
RUN yarn build

ENV PORT 5000
CMD ["node", "server.js"]

EXPOSE 5000
