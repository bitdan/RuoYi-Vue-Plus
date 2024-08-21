FROM node:16 AS frontend-builder
WORKDIR /build-app
COPY . .
RUN npm install
RUN npm run build:prod


FROM nginx:1.23
EXPOSE 80
WORKDIR /app
COPY nginx.conf /etc/nginx/nginx.conf

RUN rm -rf /usr/share/nginx/html
RUN mkdir /usr/share/nginx/html
COPY --from=frontend-builder /build-app/dist /usr/share/nginx/html

# 运行
CMD ["nginx", "-g", "daemon off;"]
