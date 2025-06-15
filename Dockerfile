# Dockerfile
FROM node:18-alpine

# Create app directory
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the app
COPY . .

# Run tests (по желание)
# RUN npm test

EXPOSE 3000
CMD ["node", "index.js"]
