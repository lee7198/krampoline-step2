# Build stage
FROM krmp-d2hub-idock.9rum.cc/goorm/node:16 AS build
WORKDIR /usr/src/app
COPY earth-client/package*.json ./
RUN npm ci
COPY earth-client/ ./
RUN npm run build

# gds npmrc
RUN echo "@goorm-dev:registry=https://npm.pkg.github.com/"
RUN echo "//npm.pkg.github.com/:_authToken=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
" > /app/.npmrc && \
    rm -f /app/.npmrc
COPY . /app/

# Run stage
FROM krmp-d2hub-idock.9rum.cc/goorm/node:16
WORKDIR /usr/src/app
COPY --from=build /usr/src/app/dist ./dist
RUN npm install -g serve
EXPOSE 5173
CMD ["serve", "dist"]
