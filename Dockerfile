FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN yarn install
COPY . .
RUN yarn build

# All the stuff /app/build

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html








