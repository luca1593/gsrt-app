# ---- Build Stage ----
FROM node:20-alpine AS build
WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build -- --configuration=development

# ---- Run Stage ----
FROM nginx:alpine
COPY --from=build /app/dist/gsrt-app /usr/share/nginx/html
EXPOSE 8089
CMD ["nginx", "-g", "daemon off;"]