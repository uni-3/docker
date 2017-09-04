FROM node:6-alpine
ENV NODE_ENV=production
ENV EXPRESS_PORT=3000

RUN mkdir /app
WORKDIR /app/
ADD package.json /app/

RUN npm install --production
ADD . /app/

EXPOSE 3000
CMD ["npm", "start"]
