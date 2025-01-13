FROM node:18-alpine

# Set working directory
WORKDIR .vercel/output/functions/fn.func

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all files
COPY . .

# Build the app
#RUN npm run index.js

# Expose the port the app runs on
EXPOSE 3000

# Start the application
CMD ["node", "build"]