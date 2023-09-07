# Build stage
FROM krmp-d2hub-idock.9rum.cc/goorm/node:16 AS build
WORKDIR /usr/src/app
COPY earth-client/package*.json ./

# gds npmrc
COPY earth-client/.npmrc ./

RUN npm i
COPY earth-client/ ./
RUN npm run build

# Run stage
FROM krmp-d2hub-idock.9rum.cc/goorm/node:16
WORKDIR /usr/src/app
COPY --from=build /usr/src/app/dist ./dist
RUN npm install -g serve
EXPOSE 5173
CMD ["serve", "dist"]