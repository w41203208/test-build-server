FROM node:21.2.0 AS build
USER root

WORKDIR /app

RUN npm install ts-node tsc yarn typescript
RUN yarn -v
RUN yarn upgrade --latest
RUN yarn
RUN yarn build


FROM node:21.2.0 AS deploy

WORKDIR /app

COPY --from=build /app/dist .

CMD ["node", "index.js"]

