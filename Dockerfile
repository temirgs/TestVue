# build stage
FROM node:lts-alpine
RUN npm install -g http-server
WORKDIR /app
COPY package*.json ./
RUN rm -rf node_modules
RUN rm package-lock.json
RUN npm install
COPY . .
RUN npm run build

EXPOSE 8080
CMD [ "http-server", "dist" ]