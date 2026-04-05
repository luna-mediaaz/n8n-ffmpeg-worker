FROM node:18-alpine
RUN apk add --no-cache ffmpeg python3 make g++
RUN npm install -g n8n
USER node
