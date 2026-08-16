FROM node:20-slim

WORKDIR /app

# Dependencies are installed at container-build time from package.json
# (you'll add package.json when you scaffold the actual React app)
COPY package*.json ./
RUN if [ -f package.json ]; then npm install; fi
