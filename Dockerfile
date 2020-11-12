FROM node:15.2.0-alpine

COPY package.json ./
COPY package-lock.json ./

RUN echo "//registry.npmjs.org/:_authToken=de3adc3a-f5dc-44f7-8d7c-885418040861" > .npmrc && \
    npm ci && \
    rm -f .npmrc

RUN npm run build

COPY . ./

EXPOSE 3000

# start app
CMD ["npm", "start"]