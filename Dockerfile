FROM node:10-alpine AS build

COPY package.json ./
COPY package-lock.json ./

COPY . .

RUN npm ci

RUN npm run build

FROM node:10-alpine

COPY --from=build /build /build
COPY --from=build /node_modules /node_modules
COPY --from=build /server.js .

EXPOSE 8080

CMD ["node", "./express.js"]