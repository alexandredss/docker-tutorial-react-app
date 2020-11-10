### MULTI STEP BUILDS ###

### TO START BUILDER FOLDER NPM BUILD ON ONE DOCKER CONTAINER SIDE
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

### RUN PHASE

FROM nginx
### COPY FROM PREVIOUS PHASE
COPY --from=builder /app/build /usr/share/nginx/html
