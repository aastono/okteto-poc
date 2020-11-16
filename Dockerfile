FROM node:15.2.0-alpine

WORKDIR /src/app

COPY package.json ./
COPY package-lock.json ./

RUN npm cache clean --force

RUN npm install

RUN npm run build

COPY . .

EXPOSE 8080

CMD ["node express.js"]
