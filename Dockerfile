# Build stage
FROM node:18-alpine as build

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci && \
    npm cache clean --force
COPY . .
RUN npm run build

# Production stage
FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]