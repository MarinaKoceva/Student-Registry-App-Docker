# Use official Node.js image
FROM node:18

# Create app directory
WORKDIR /app

# Copy app files
COPY package*.json ./
RUN npm install
COPY . .

# Start the app
CMD ["npm", "start"]
