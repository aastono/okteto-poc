FROM node:15.2.0-alpine

WORKDIR /src

COPY package.json ./
COPY package-lock.json ./

RUN npm install

RUN npm run build

COPY . .

EXPOSE 8080

CMD ["node express.js"]
