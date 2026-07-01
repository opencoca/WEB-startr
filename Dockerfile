# Stage 1: Build the static site with Eleventy
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY src/ src/
RUN cd src && npx @11ty/eleventy --output=../_site

# Stage 2: Serve with nginx
FROM nginx:alpine
COPY --from=build /app/_site /usr/share/nginx/html
EXPOSE 80
