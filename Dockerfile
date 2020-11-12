FROM node:15.2.0-alpine

COPY package.json ./
COPY package-lock.json ./

RUN npm run build

COPY . ./

EXPOSE 3000

# start app
CMD ["npm", "start"]