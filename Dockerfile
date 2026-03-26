FROM node:25-slim
LABEL AUTHOR="Valentins Koposovs"

WORKDIR /sample-book-app

COPY index.js index.js
COPY package.json package.json

RUN npm install

EXPOSE 1050

ENTRYPOINT [ "node" ]
CMD [ "index.js" ]
