# ---- Build Stage ----
FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build -- --configuration=development

# ---- Run Stage ----
FROM nginx:alpine
COPY --from=build /app/dist/grst-app /usr/share/nginx/html
EXPOSE 8089
CMD ["nginx", "-g", "daemon off;"]