FROM node:15.2.0-alpine AS ui-build

WORKDIR /usr/src/app

COPY src/ ./src/
RUN cd src && npm install && npm run build



FROM node:15.2.0-alpine AS server-build

WORKDIR /root/

COPY --from=ui-build /usr/src/app/src/build ./src/build

EXPOSE 8080

CMD ["node", "./server.js"]