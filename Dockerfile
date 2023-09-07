# Build stage
FROM krmp-d2hub-idock.9rum.cc/goorm/node:16
WORKDIR /usr/src/app
COPY krampoline/ ./

# gds npmrc
RUN echo "@goorm-dev:registry=https://npm.pkg.github.com/"
RUN echo "//npm.pkg.github.com/:_authToken=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" > /app/.npmrc && \
    rm -f /app/.npmrc
COPY . /app/


RUN npm ci
RUN npm run build
RUN npm install -g serve
EXPOSE 5173
CMD ["serve", "dist"]
