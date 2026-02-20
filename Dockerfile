# ---- Build Stage ----
FROM node:20-alpine AS build
WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build -- --configuration=development

# ---- Run Stage ----
FROM nginx:alpine
COPY --from=build /app/dist/gsrt-app/browser /usr/share/nginx/html
EXPOSE 8089
RUN ls -la /app/dist/gsrt-app
CMD ["nginx", "-g", "daemon off;"]